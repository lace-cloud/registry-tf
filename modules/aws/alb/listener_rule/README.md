# AWS ALB Listener Rule

AWS ALB listener rule with host/path conditions and forward, redirect, or fixed-response actions

## Usage

```hcl
module "alb_listener_rule" {
  source  = "lace.cloud/lace/alb-listener-rule/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
