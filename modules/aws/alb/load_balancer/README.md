# AWS ALB Load Balancer

AWS Application Load Balancer with subnets, security groups, and access logs

## Usage

```hcl
module "alb_load_balancer" {
  source  = "lace.cloud/lace/alb-load-balancer/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
