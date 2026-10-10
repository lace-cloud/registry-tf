# AWS ACM Certificate

AWS ACM certificate with DNS or EMAIL validation

## Usage

```hcl
module "acm_certificate" {
  source  = "lace.cloud/lace/acm-certificate/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
