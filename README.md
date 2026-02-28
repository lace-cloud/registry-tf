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
        ├── terraform-registry-auto-register.yml  # Auto-registers on push to main
        ├── terraform-registry-manual-register.yml # Manual trigger
        └── pr-validate-modules.yml               # Validates on PRs
```

## Module Structure

Every module requires:

- `module.yaml` — module metadata
- `main.tf` — Terraform resources

```
modules/aws/s3/bucket/
modules/aws/sqs/queue/
modules/aws/cloudwatch/log_group/
```

`variables.tf`, `outputs.tf`, and `versions.tf` are optional but recommended for better module discoverability.

## module.yaml Reference

Every module requires a `module.yaml` file. The `registry_visibility` field is critical to get right.

```yaml
module:
  id: aws/service/module-name            # Required: unique registry ID
  name: module-name                      # Required: kebab-case name
  system: aws                            # Required: aws | gcp | azure
  version: 1.0.0                         # Required: semantic version
  registry_visibility: public            # Required for Lace public registry
  description: "What this module does"   # Required

  categories:
    - storage                            # Optional: for discoverability

  authors:
    - name: "Lace Platform Team"
      email: "team@lace.cloud"

  example: |                             # Optional but strongly recommended
    module "example" {
      source = "git::https://github.com/lace-cloud/registry-tf.git//modules/aws/s3/bucket?ref=v1.0.0"
      bucket_name = "my-bucket"
    }
```

### Critical fields

| Field | Value | Why it matters |
|---|---|---|
| `registry_visibility` | `public` | **Required** for the Lace public registry. Omitting it defaults to `private`, which requires `--organization` at registration time and will fail in CI. |
| `id` | `aws/service/name` | Must be unique across the registry. |

## Adding an Atomic Module

1. Create the directory: `modules/aws/<service>/<name>/`

2. Add the required files:

   **`module.yaml`**
   ```yaml
   module:
     id: aws/storage/my-bucket
     name: my-bucket
     system: aws
     version: 1.0.0
     registry_visibility: public
     description: "..."
   ```

   **`main.tf`** — your Terraform resources

   **`versions.tf`**
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

3. Validate locally:
   ```bash
   cd modules/aws/<service>/<name>
   terraform init && terraform validate
   terraform fmt -check
   ```

4. Open a PR targeting `develop`. CI will run format check, validate, and parse.

5. After merging to `main`, the auto-register workflow registers it automatically.

## CI Workflows

### PR Validation (`pr-validate-modules.yml`)

Runs on every PR touching `modules/**`:

| Step | |
|---|---|
| Terraform fmt check | ✅ |
| Terraform validate | ✅ |
| lace module parse | ✅ |
| Security scan (tfsec) | ✅ soft-fail |

### Auto Registration (`terraform-registry-auto-register.yml`)

Runs on push to `main`. Detects changed modules and registers each one via `lace terraform-registry register`.

### Manual Registration (`terraform-registry-manual-register.yml`)

Manually trigger registration from the Actions tab. Accepts `module_path` and optional `force_register` inputs.

## Troubleshooting

### `organization is required for private modules`

The module's `module.yaml` is missing `registry_visibility: public`. Add the field:

```yaml
module:
  ...
  registry_visibility: public
```

### `terraform validate` fails with `ref=v1.0.0 not found`

This occurs when a module references git sources that haven't been tagged yet. Use a commit SHA instead of a version tag for development, or ensure the referenced modules have valid tags.

### `module.yaml not found` or `main.tf is required`

Both files are required in every module directory. Check the module path and file names (case-sensitive).

### Module parses locally but fails CI

Run `lace module parse --path <module-path>` locally to reproduce. Ensure you're using the same lace binary version as CI (downloaded from `https://releases.lace.cloud/lace-cli-linux-amd64`).
