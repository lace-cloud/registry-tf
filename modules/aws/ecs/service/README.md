# AWS ECS Service

AWS ECS Fargate service with load balancer integration and network configuration

## Usage

```hcl
module "ecs_service" {
  source  = "lace.cloud/lace/ecs-service/aws"
  version = "1.0.1"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
