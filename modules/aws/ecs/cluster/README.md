# AWS ECS Cluster

AWS ECS cluster with Container Insights and capacity provider configuration

## Usage

```hcl
module "ecs_cluster" {
  source  = "lace.cloud/lace/ecs-cluster/aws"
  version = "1.0.1"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
