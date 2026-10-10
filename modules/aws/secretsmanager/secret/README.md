# AWS Secrets Manager Secret

AWS Secrets Manager secret with optional initial value and KMS encryption

## Usage

```hcl
module "secretsmanager_secret" {
  source  = "lace.cloud/lace/secretsmanager-secret/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
