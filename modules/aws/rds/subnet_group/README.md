# AWS RDS Subnet Group

AWS RDS DB subnet group for placing RDS instances within a VPC

## Usage

```hcl
module "rds_subnet_group" {
  source  = "lace.cloud/lace/rds-subnet-group/aws"
  version = "1.0.2"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
