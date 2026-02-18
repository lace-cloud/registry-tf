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

## Module Types

### Leaf Modules (`kind: leaf`)

Atomic modules that manage a single AWS resource or closely related set of resources. These are the building blocks.

```
modules/aws/s3/bucket/
modules/aws/sqs/queue/
modules/aws/cloudwatch/log_group/
```

### Composite Modules (`kind: composite`)

Modules that compose multiple leaf modules into a ready-to-use pattern. They reference leaf modules via git source URLs.

```
modules/aws/s3/cloudfront_website/    # S3 + CloudFront + OAI
modules/aws/rds/with_monitoring/      # RDS + subnet group + CloudWatch alarms
modules/aws/eventbridge/scheduled_sqs/ # EventBridge rule + SQS + log group
```

## module.yaml Reference

Every module requires a `module.yaml` file. The `kind` and `registry_visibility` fields are critical to get right.

```yaml
module:
  id: aws/service/module-name            # Required: unique registry ID
  name: module-name                      # Required: kebab-case name
  system: aws                            # Required: aws | gcp | azure
  version: 1.0.0                         # Required: semantic version
  kind: leaf                             # Required: leaf | composite
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
| `kind` | `leaf` or `composite` | Controls CI validation. Composites skip `terraform validate` (leaf modules are validated normally). |
| `id` | `aws/service/name` | Must be unique across the registry. |

## Adding a Leaf Module

1. Create the directory: `modules/aws/<service>/<name>/`

2. Add the required files:

   **`module.yaml`**
   ```yaml
   module:
     id: aws/storage/my-bucket
     name: my-bucket
     system: aws
     version: 1.0.0
     kind: leaf
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

## Adding a Composite Module

Composites reference leaf modules via git source URLs. Because those URLs require a git tag to initialize (`?ref=v1.0.0`), **`terraform validate` is intentionally skipped** for composites in CI — `lace module parse` handles structural validation instead.

1. Create the directory: `modules/aws/<service>/<name>/`

2. **`module.yaml`** — set `kind: composite`:
   ```yaml
   module:
     id: aws/service/my-composite
     name: my-composite
     system: aws
     version: 1.0.0
     kind: composite                  # <-- triggers composite CI path
     registry_visibility: public      # <-- required for public registry
     description: "..."
   ```

3. **`main.tf`** — reference leaf modules by git source:
   ```hcl
   module "queue" {
     source = "git::https://github.com/lace-cloud/registry-tf.git//modules/aws/sqs/queue?ref=v1.0.0"
     name   = var.name
     tags   = var.tags
   }
   ```

4. Open a PR targeting `develop`. CI skips `terraform validate` and runs `lace module parse` for structural validation.

5. After merging to `main`, the auto-register workflow registers it automatically.

## CI Workflows

### PR Validation (`pr-validate-modules.yml`)

Runs on every PR touching `modules/**`:

| Step | Leaf | Composite |
|---|---|---|
| Terraform fmt check | ✅ | ✅ |
| Terraform validate | ✅ | ⏭ skipped |
| lace module parse | ✅ | ✅ |
| Security scan (tfsec) | ✅ soft-fail | ✅ soft-fail |

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

This is expected for **composite** modules before the repo has been tagged. The CI workflow skips `terraform validate` for composites (checks `kind:` in `module.yaml`). If you see this error in CI, verify your `module.yaml` has `kind: composite`.

### `module.yaml not found` or `main.tf is required`

Both files are required in every module directory. Check the module path and file names (case-sensitive).

### Module parses locally but fails CI

Run `lace module parse --path <module-path>` locally to reproduce. Ensure you're using the same lace binary version as CI (downloaded from `https://releases.lace.cloud/lace-cli-linux-amd64`).
