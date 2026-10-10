# AWS EC2 Security Group

AWS EC2 Security Group with configurable ingress and egress rules

## Usage

```hcl
module "ec2_security_group" {
  source  = "lace.cloud/lace/ec2-security-group/aws"
  version = "1.0.1"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
