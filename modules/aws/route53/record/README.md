# AWS Route53 Record

AWS Route53 DNS record supporting both standard and alias record types

## Usage

```hcl
module "route53_record" {
  source  = "lace.cloud/lace/route53-record/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
