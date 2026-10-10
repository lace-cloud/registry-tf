# AWS Cognito User Pool

AWS Cognito user pool with configurable password policy and email verification

## Usage

```hcl
module "cognito_user_pool" {
  source  = "lace.cloud/lace/cognito-user-pool/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
