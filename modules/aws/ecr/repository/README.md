# AWS ECR Repository

AWS ECR repository with configurable image scanning, encryption, and lifecycle policies

## Usage

```hcl
module "ecr_repository" {
  source  = "lace.cloud/lace/ecr-repository/aws"
  version = "1.0.1"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
