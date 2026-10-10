# AWS IAM Policy

AWS IAM policy with configurable policy document and tags

## Usage

```hcl
module "iam_policy" {
  source  = "lace.cloud/lace/iam-policy/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
