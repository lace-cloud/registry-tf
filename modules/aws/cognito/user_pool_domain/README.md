# AWS Cognito User Pool Domain

AWS Cognito hosted UI domain for a user pool

## Usage

```hcl
module "cognito_user_pool_domain" {
  source  = "lace.cloud/lace/cognito-user-pool-domain/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
