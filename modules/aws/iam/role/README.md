# AWS IAM Role

AWS IAM role with configurable assume role policy and tags

## Usage

```hcl
module "iam_role" {
  source  = "lace.cloud/lace/iam-role/aws"
  version = "1.0.1"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
