# AWS IAM Role Policy Attachment

AWS IAM role policy attachment for connecting policies to roles

## Usage

```hcl
module "iam_policy_attachment" {
  source  = "lace.cloud/lace/iam-policy-attachment/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
