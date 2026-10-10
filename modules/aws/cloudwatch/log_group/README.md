# AWS CloudWatch Log Group

AWS CloudWatch Log Group with configurable retention and encryption

## Usage

```hcl
module "cloudwatch_log_group" {
  source  = "lace.cloud/lace/cloudwatch-log-group/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
