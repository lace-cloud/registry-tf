# AWS Cognito User Pool Client

AWS Cognito user pool app client with configurable OAuth flows, scopes, and token validity

## Usage

```hcl
module "cognito_user_pool_client" {
  source  = "lace.cloud/lace/cognito-user-pool-client/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
