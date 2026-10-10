# AWS ALB Target Group

AWS ALB target group with health check configuration for Fargate (IP target type)

## Usage

```hcl
module "alb_target_group" {
  source  = "lace.cloud/lace/alb-target-group/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
