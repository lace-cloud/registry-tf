# AWS ECS Task Definition

AWS ECS task definition for Fargate with container definitions, CPU/memory, and IAM roles

## Usage

```hcl
module "ecs_task_definition" {
  source  = "lace.cloud/lace/ecs-task-definition/aws"
  version = "1.0.1"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
