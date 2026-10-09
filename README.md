# registry

Lace's own registry repository. The `lace` organization publishes the default
modules, scanners, handlers and agents that every Lace organization can install
from here. It publishes through the same two GitHub Actions any organization's
registry repository uses: [`lace-cloud/registry-check`](https://github.com/lace-cloud/registry-check)
on pull requests and [`lace-cloud/registry-publish`](https://github.com/lace-cloud/registry-publish)
on merges.

To run a registry repository for your own organization, follow
[Publishing to the registry from CI](https://lace.cloud/docs/registry-publishing).

## Layout

```
registry/
├── modules/     ← Terraform modules
├── scanners/    ← Observatory scanners
├── handlers/    ← Handlers (Run gates)
└── agents/      ← Agents
```

Each artifact is a directory `<axis>/<author>/<name>/` holding `manifest.yaml`
and `README.md`. A module also carries its `*.tf` files and may nest under a
cloud-system tier (`modules/aws/<name>/`). Lace's defaults live under
`<axis>/lace/`.

## Workflows

| File | Runs on | What it does |
|---|---|---|
| `check.yml` | a pull request to `develop` or `main` | `registry-check` checks every manifest the pull request changes: the envelope fields, a version bump against the base branch, and for a module a `lace module validate` verdict of `already-lace-style`. |
| `publish.yml` | a push to `main` | `registry-publish` publishes every manifest the push changed to production, https://lace.cloud, with `LACE_TOKEN`. |
| `publish-preview.yml` | a push to `develop` | The same action publishes to preview, https://preview.lace.cloud, with `LACE_PREVIEW_TOKEN`. |

`check.yml` and `publish.yml` are the two files the publishing guide gives every
organization. The preview caller is the one addition, because Lace runs two
environments.

## Branches

```
feature/* → develop → main
```

A pull request into `develop` is checked; merging it publishes to preview. A
`develop` → `main` pull request is checked again; merging it publishes to
production.

## Tokens

Two repository secrets, each a service token minted in one Lace environment's
`lace` organization with the `registry:publish` scope, naming
`lace-cloud/registry` as the repository it publishes from:

| Secret | Environment | Branch the token names |
|---|---|---|
| `LACE_TOKEN` | production | `main` |
| `LACE_PREVIEW_TOKEN` | preview | `develop` |

A token publishes only from a run of this repository on its own branch. Whoever
can push to `main` or `develop` can publish, so both branches are protected.

## Manifest envelope

Every artifact's `manifest.yaml` starts with the same envelope:

```yaml
apiVersion: '1'
axis: module | scanner | handler | agent
author: lace                  # kebab-case, 1-64 characters
name: aws-iam-role            # kebab-case, 1-64 characters, unique within axis and author
version: v1.0.0               # v-prefixed semver
displayName: AWS IAM Role     # 1-96 characters
description: ...              # optional
categories: [iam, security]   # optional
configSchema: { ... }         # JSON Schema for per-install config
runtime:
  location: in-tree | external
  # external also declares dispatch: lace-pull | customer-push | customer-poll
```

Each axis adds its own fields on top. The publish endpoint validates each
manifest against its axis when it is published; the
[registry docs](https://lace.cloud/docs/registry) list what each axis needs.

## Publishing rules

- Publishing is idempotent on `(axis, author, name, version)` and the manifest's
  content. Re-publishing identical content reports `unchanged`.
- A manifest is immutable per version. Publishing different content at a
  version that already exists is refused with `409`. Bump `version` to ship a
  change.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

```bash
git checkout develop && git pull
git checkout -b feature/scanner-aws-foo
mkdir -p scanners/lace/aws-foo
# write scanners/lace/aws-foo/manifest.yaml and README.md
git add scanners/lace/aws-foo
git commit -m "feat(scanners): lace/aws-foo"
git push -u origin feature/scanner-aws-foo
gh pr create --base develop
```

## Troubleshooting

### The publish job fails with `publish is CI-only: refused for a run of … this token publishes from another repository` or `… another branch`

The secret holds a token minted for another repository or branch. Mint a new
`registry:publish` token in that environment's `lace` organization naming
`lace-cloud/registry` and the branch in the table above, and replace the
secret.

### The publish job fails with `no token`

The secret the workflow passes is not set. Add it as in the table above.

### The publish job fails with `401`

The token in the secret was revoked or has expired. Mint a new one as above.

### The publish job fails with `Manifest already published at this identity with different content`

Bump `version` in the manifest and push again.
