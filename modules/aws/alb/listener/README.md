# AWS ALB Listener

AWS ALB listener with default action and optional SSL certificate

## Usage

```hcl
module "alb_listener" {
  source  = "lace.cloud/lace/alb-listener/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
