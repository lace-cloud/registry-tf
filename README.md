# registry-tf

Terraform modules for the [Lace](https://lace.cloud) public registry.

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
    └── workflows/
        ├── validate.yml   # PR quality gate
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

1. Create a branch from `develop`:
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

5. Open a PR to `develop`. CI runs `validate.yml`:
   - Structure check (module.yaml + main.tf exist)
   - Field validation (id, name, system, version, registry_visibility)
   - Module ID uniqueness
   - Version bump check (vs base branch)
   - `terraform fmt -check`
   - `terraform init && terraform validate`
   - `lace module parse`

6. Merge to `develop`, then PR `develop` to `main`.

7. On merge to `main`, `publish.yml` auto-registers the module in the Lace registry.

## CI Workflows

### PR Validation (`validate.yml`)

Runs on PRs targeting `develop` or `main` that touch `modules/**`.
Detects changed module directories and validates each one in parallel.

| Check | Blocks PR |
|---|---|
| Structure (module.yaml + main.tf) | Yes |
| module.yaml required fields | Yes |
| Module ID uniqueness | Yes |
| Version bump vs base branch | Yes |
| `terraform fmt -check` | Yes |
| `terraform validate` | Yes |
| `lace module parse` | Yes |

### Auto Publish (`publish.yml`)

Runs on push to `main` (or manual `workflow_dispatch`). Detects changed modules,
authenticates with the service account API key, and registers each module via
`lace terraform-registry register`.

## Troubleshooting

### `organization is required for private modules`

The module's `module.yaml` is missing `registry_visibility: public`. Add the field.

### `terraform validate` fails with provider errors

Ensure `versions.tf` declares the correct provider and version constraint.
Run `terraform init -backend=false` locally to reproduce.

### Module ID conflict

Each module must have a globally unique `id` in `module.yaml`.
Check existing modules for conflicts: `grep -r "^  id:" modules/`.

### CI validation passes but publish fails

The publish workflow requires the `LACE_SERVICE_ACCOUNT_KEY` secret.
Verify it's set in the repository settings.
