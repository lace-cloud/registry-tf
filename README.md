# registry

The public Lace registry monorepo. One repo, four artifact axes, one publish endpoint.

## What lives here

```
registry/
├── modules/                ← Terraform modules
├── scanners/               ← Observatory scanners (drift, cost, anomalies, …)
├── handlers/               ← Handlers (Run-lifecycle gates: pre/post-plan + apply)
└── agents/                 ← Agents (coach, detective, triage, …)
```

Each axis subdir holds `<author>/<name>/{manifest.yaml, README.md, …}`. Modules additionally carry `*.tf` siblings and may nest under a cloud-system tier (`modules/aws/<name>/`).

## Branch strategy

```
feature/* → develop → main
```

| Branch     | Purpose                                                                  |
|------------|--------------------------------------------------------------------------|
| `feature/*` | Manifest authoring — branch from `develop`                              |
| `develop`   | Integration. CI validates on PR; a push publishes to preview.           |
| `main`      | Production. A push publishes to production.                             |

Both branches require PR + passing checks. Changes to `.github/` need `@lace-cloud/platform-team` review (CODEOWNERS).

## Manifest envelope

Every artifact ships a `manifest.yaml` with the same base envelope:

```yaml
apiVersion: '1'
axis: module | scanner | handler | agent
author: lace                       # kebab-case (1-64 chars)
name: aws-iam-role                 # kebab-case (1-64 chars), unique within axis+author
version: v1.0.0                    # semver, must be 'v'-prefixed
displayName: "AWS IAM Role"        # human-readable (1-96 chars)
description: "..."                 # optional
categories: [iam, security]        # optional
configSchema: { ... }              # JSON-Schema for per-install config
runtime:
  location: lace-managed | customer-hosted
  # customer-hosted requires `dispatch: lace-pull | customer-push`
authors: ["Lace Team <team@lace.cloud>"]
# Axis-specific fields layered on top:
# - module: bundle.{system, modulePath, gitUrl, commitSha, ...}
# - scanner: outputs.{findings, snapshots, time_series, inventory}
# - handler: hooks.{available, default}, endpointSource, signing, verdictMode
# - agent: trigger.{producer, hooks}, emits.manifestation
```

Validation: per-axis zod schemas in `apps/api/src/lib/registry/axes/*.ts` are the source of truth. CI runs an envelope-shape pre-check; the API does deep validation at publish time.

## How publishing works

A push to `develop` or `main` that touches `modules/**`, `scanners/**`, `handlers/**`, or `agents/**` triggers `publish.yml`:

1. Detect the `manifest.yaml` directories changed across the whole push.
2. Install the pinned `lace` CLI with the signed installer from `releases.lace.cloud`.
3. Per manifest: `lace registry register --axis <axis> --manifest <dir>/manifest.yaml --readme <dir>/README.md`; a module is validated first and published with `--path <dir>`. Every publish carries the job's GitHub OIDC token.
4. The CLI reads its API base URL from `LACE_AUTH_URL` and its credential from `LACE_TOKEN`, and POSTs to `/api/v1/registry/index`.

### Lace defaults and environments

Lace's default artifacts live under `<axis>/lace/` (`agents/lace/`, `handlers/lace/`, `scanners/lace/`). A push to `develop` publishes to preview (https://preview.lace.cloud); a push to `main` publishes to production (https://lace.cloud). A manual dispatch publishes from the branch it runs on: `main` to production, any other branch to preview.

The Register job runs in the GitHub environment `prod` (for `main`) or `preview` (otherwise) and reads `LACE_TOKEN` from that environment's secrets. Each environment needs its own `LACE_TOKEN`: a service token from that Lace environment's `lace` org with the `registry:publish` scope. A repository admin has to add them — environment secrets in an organization repo require admin access. Until they exist, a publish fails at the Authenticate step.

The publish endpoint is idempotent on `(axis, author, name, version) + sha256(manifest.yaml)`. Re-publishing identical content is a no-op (`result: 'unchanged'`). Re-publishing a different `manifest.yaml` at the same `(axis, author, name, version)` is rejected (409): manifests are immutable per version.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for the per-axis acceptance criteria and review checklist.

```bash
git checkout develop && git pull
git checkout -b feature/scanner-aws-foo
mkdir -p scanners/lace/aws-foo
# author scanners/lace/aws-foo/manifest.yaml + README.md
git add scanners/lace/aws-foo
git commit -m "feat(scanners): seed lace/aws-foo"
git push -u origin feature/scanner-aws-foo
gh pr create --base develop
```

Merging to `develop` publishes to preview. A develop → main PR then publishes to production.

## Running a private registry

Customer orgs that want PR-reviewed authoring of internal manifests use the [`registry-template`](https://github.com/lace-cloud/registry-template) repo as a starting point. Same folder structure, same workflows, same `lace registry register` CLI (the template names its secret `LACE_TOKEN`) — the only difference is the API key's scope:

- **This repo (public):** key holds `REGISTRY_PUBLISH` scope. Manifests land at `org_id = NULL`, visible to every Lace org.
- **Customer private repo:** key holds `REGISTRY_PUBLISH:org` scope. Manifests land at `org_id = <caller's org>`, visible only to that org's catalog browse.

The unified publish endpoint clamps `org_id` server-side based on the bearer token's scope; the request body cannot override.

## Troubleshooting

### `authentication failed` / `unauthorized`

Verify the `LACE_TOKEN` secret is set in the `prod` or `preview` environment the run used, and that the service token belongs to that environment's `lace` org and has the `registry:publish` scope.

### Manifest envelope rejected at publish

The CI envelope check is a fast fail; the API's per-axis zod is the deep gate. If publish fails with a validation error, read the per-axis schema in [`apps/api/src/lib/registry/axes/`](https://github.com/lace-cloud/lace/tree/develop/apps/api/src/lib/registry/axes) — that's the contract.

### `409: manifest at this version already published with different content`

Manifests are immutable per `(axis, author, name, version)`. Bump the `version` field and reopen the PR.
