# Platform Guide

Internal reference for `@lace-cloud/platform-team`. For contributor-facing docs, see [README.md](README.md).

## CI Workflows

Three workflows run in pipeline order: **Validate** → **Gate** → **Publish**.

### Validate (`validate.yml`)

Runs on PRs targeting `develop`.

**Jobs:** Detect Changed Modules → Validate (matrix) → Summary

| Job | What it does |
|-----|-------------|
| Detect Changed Modules | `tj-actions/changed-files` with `files: modules/**`, walks up to find `module.yaml` roots. Fails if changed files are orphaned (no parent `module.yaml`). |
| Validate | Matrix per module. Runs in parallel (`fail-fast: false`). |
| Summary | Rollup gate — reports pass/fail to PR. |

**Validate checks (in order):**

1. Structure — `module.yaml` + `main.tf` exist
2. Field validation — `id`, `name`, `system`, `version`, `registry_visibility` present; visibility must match `REGISTRY_VISIBILITY` variable (defaults to `public`)
3. Module ID uniqueness — scans all `module.yaml` files in repo
4. Version bump — compares `version` field against base branch; skipped for new modules
5. `terraform fmt -check -recursive`
6. `terraform init -backend=false && terraform validate`
7. `lace module parse` (Lace CLI downloaded from `releases.lace.cloud`)

**Concurrency:** `validate-${{ github.event.pull_request.number }}`, cancels in-progress.

**Permissions:** `contents: read`

### Gate (`gate.yml`)

Runs on PRs targeting `main`.

Single job (`Source Branch`) that checks `github.head_ref == "develop"`. Fails with error if source branch is anything else.

**Required status check:** `Gate / Source Branch` — must be configured in branch protection rulesets for `main`.

No concurrency group (single lightweight job).

### Publish (`publish.yml`)

**Triggers:**

| Trigger | Condition | Authorization |
|---------|-----------|---------------|
| Push to `main` | `paths: ['modules/**']` | None (already gated by branch protection) |
| `workflow_dispatch` | Manual, accepts `module_path` input | Requires `@lace-cloud/platform-team` membership |

**Jobs:** Authorize (conditional) → Prepare → Register (matrix) → Summary

| Job | Details |
|-----|---------|
| Authorize | Runs only for `workflow_dispatch`. Generates GitHub App token (`LACE_ORG_CI_APP_ID` + `LACE_ORG_CI_PRIVATE_KEY`), checks actor's membership in `platform-team` via API. |
| Prepare | Runs if Authorize succeeded or was skipped. For push: `git diff HEAD^ HEAD` to find changed modules. For dispatch: validates the provided `module_path` exists. |
| Register | Matrix per module (`fail-fast: false`). Each: validate structure → `setup-terraform` → install Lace CLI → authenticate with `LACE_API_KEY` → `lace terraform-registry register` (with optional `--organization` from `LACE_ORGANIZATION`) → verify via `lace terraform-registry get`. |
| Summary | Reports registered modules and result. |

**Concurrency:** `publish-${{ github.ref }}`, does **not** cancel in-progress (every merge must publish).

**Permissions:** `contents: read`

## Branch Protection

Both `main` and `develop` are protected via GitHub rulesets:

| Rule | `main` | `develop` |
|------|--------|-----------|
| Require PR | Yes | Yes |
| Required status checks | `Gate / Source Branch` | `Summary` |
| CODEOWNERS review | Yes (`.github/` changes) | Yes (`.github/` changes) |

CODEOWNERS: `/.github/ @lace-cloud/platform-team`

**Team:** `platform-team` (member: thankrandomness)

**Archive branch:** `archive/all-modules` — preserves all 36 original modules before cleanup.

## Secrets

| Secret | Purpose | Used by |
|--------|---------|---------|
| `LACE_API_KEY` | API key for registry publishing (service account key for public, org-scoped key for private) | `publish.yml` (Register job) |
| `LACE_ORG_CI_APP_ID` | GitHub App ID for org API access | `publish.yml` (Authorize job) |
| `LACE_ORG_CI_PRIVATE_KEY` | GitHub App private key | `publish.yml` (Authorize job) |

## Variables

| Variable | Default | Purpose | Used by |
|----------|---------|---------|---------|
| `LACE_ORGANIZATION` | _(unset)_ | Organization slug for private registries. When set, passes `--organization` to CLI commands. | `publish.yml` (Register job) |
| `REGISTRY_VISIBILITY` | `public` | Expected `registry_visibility` value in `module.yaml`. Set to `private` for private registries. | `validate.yml` (Validate job) |

### Service Account

- **User:** `Lace Registry Bot` (`registry-bot@lace.cloud`), `is_service_account = 1` in D1
- **API Key:** hashed in `api_key` table, metadata `{ type: "service_account", purpose: "public_registry_publishing" }`
- **Key generation:** `lace-middleware/scripts/create-service-account-key.ts` — generates crypto locally, outputs wrangler D1 commands
- Service accounts can publish public modules without `x-org-slug` header (enforced in `terraform-registry.ts`)
- **Rename note:** The repo secret was renamed from `LACE_SERVICE_ACCOUNT_KEY` to `LACE_API_KEY` to support both service account keys (public) and org-scoped keys (private forks)

## Troubleshooting

### CI validation passes but publish fails

The Register job requires `LACE_API_KEY`. Verify it's set in repository Settings → Secrets and variables → Actions.

### Manual dispatch authorization failure

The `workflow_dispatch` Authorize job checks `platform-team` membership via the GitHub API using a GitHub App token. Possible causes:

- Actor is not a member of `@lace-cloud/platform-team`
- `LACE_ORG_CI_APP_ID` or `LACE_ORG_CI_PRIVATE_KEY` secrets are missing or expired

### Required status check not found

Status check names include the workflow name prefix. If a workflow is renamed, update the branch ruleset to match (e.g., `Gate / Source Branch`, not just `Source Branch`).

### Path filter triggers on deletions

`modules/**` matches deleted files too. Cleanup PRs that remove module directories will trigger `validate.yml`. The Detect Changed Modules job handles this — orphaned files (no parent `module.yaml`) cause a failure.

## Gotchas

- jq in GitHub Actions: don't escape backticks (`` \` `` is invalid in jq), use raw backticks
- `lace terraform-registry register` internally runs `terraform validate` — publish workflow needs `setup-terraform`
- CODEOWNERS file must be on the default branch (`main`) to take effect
