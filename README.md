# registry-tf

Terraform modules for the [Lace](https://lace.cloud) public registry.

## Branch Strategy

All changes follow a three-tier flow:

```
feature/* → develop → main
```

| Branch | Purpose |
|--------|---------|
| `feature/*` | Individual module work — branch from `develop` |
| `develop` | Integration branch — every module is validated before merging here |
| `main` | Production — merging here publishes modules to the registry |

Both `develop` and `main` are protected branches requiring a PR and passing status checks.

Changes to `.github/` require review from `@lace-cloud/platform-team` (CODEOWNERS).

## Repository Structure

```
registry-tf/
├── modules/
│   └── aws/
│       └── <service>/
│           └── <module-name>/
│               ├── module.yaml   # Module metadata (required)
│               ├── main.tf       # Terraform resources (required)
│               ├── variables.tf
│               ├── outputs.tf
│               └── versions.tf
└── .github/
    ├── CODEOWNERS
    └── workflows/
        ├── validate.yml   # PR validation on develop
        ├── gate.yml       # Source branch check on main
        └── publish.yml    # Auto-registers on merge to main
```

## Module Structure

Every module requires:

- `module.yaml` — module metadata
- `main.tf` — Terraform resources

```
modules/aws/s3/bucket/
modules/aws/iam/role/
modules/aws/cloudwatch/log_group/
```

`variables.tf`, `outputs.tf`, and `versions.tf` are optional but recommended.

## module.yaml Reference

```yaml
module:
  id: aws/service/module-name            # Required: unique registry ID
  name: module-name                      # Required: kebab-case name
  system: aws                            # Required: aws | gcp | azure
  version: 1.0.0                         # Required: semantic version
  registry_visibility: public            # Required for public registry
  description: "What this module does"   # Required

  categories:
    - storage                            # Optional: for discoverability

  authors:
    - name: "Lace Platform Team"
      email: "team@lace.cloud"

  example: |                             # Optional but recommended
    module "example" {
      source = "git::https://github.com/lace-cloud/registry-tf.git//modules/aws/s3/bucket?ref=<sha>"
      bucket_name = "my-bucket"
    }
```

### Critical fields

| Field | Value | Why it matters |
|---|---|---|
| `registry_visibility` | `public` | Required. Omitting defaults to `private`, which fails in CI. |
| `id` | `aws/service/name` | Must be unique across the registry. |

## Contributing a Module

1. Branch from `develop`:
   ```bash
   git checkout develop && git pull
   git checkout -b feature/aws-<service>-<name>
   ```

2. Create the module directory: `modules/aws/<service>/<name>/`

3. Add required files:

   **`module.yaml`**
   ```yaml
   module:
     id: aws/<service>/<name>
     name: <name>
     system: aws
     version: 1.0.0
     registry_visibility: public
     description: "..."
   ```

   **`main.tf`** — your Terraform resources

   **`versions.tf`** (recommended)
   ```hcl
   terraform {
     required_version = ">= 1.3"
     required_providers {
       aws = {
         source  = "hashicorp/aws"
         version = ">= 5.0"
       }
     }
   }
   ```

4. Validate locally:
   ```bash
   cd modules/aws/<service>/<name>
   terraform init -backend=false && terraform validate
   terraform fmt -check
   ```

5. Open a PR to `develop` — CI validates structure, fields, uniqueness, version bump, formatting, and `terraform validate`.

6. Once merged, open a PR from `develop` to `main`.

7. Merge to `main` — the module is automatically registered in the Lace registry.

## Troubleshooting

### `organization is required for private modules`

The module's `module.yaml` is missing `registry_visibility: public`. Add the field.

### `terraform validate` fails with provider errors

Ensure `versions.tf` declares the correct provider and version constraint.
Run `terraform init -backend=false` locally to reproduce.

### Module ID conflict

Each module must have a globally unique `id` in `module.yaml`.
Check existing modules for conflicts: `grep -r "^  id:" modules/`.

### Gate fails: "PRs to main must come from develop"

Only `develop` can be merged into `main`. If you opened a PR from a feature branch directly to `main`, close it and follow the standard flow: PR to `develop` first, then `develop` to `main`.
