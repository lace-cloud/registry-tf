module "aws_ecs_task_definition_this" {
  source                   = "./aws_ecs_task_definition_this"
  container_definitions    = var.container_definitions
  cpu                      = var.cpu
  execution_role_arn       = var.execution_role_arn
  family                   = var.family
  memory                   = var.memory
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  tags                     = var.tags
  task_role_arn            = var.task_role_arn
}
moved {
  from = aws_ecs_task_definition.this
  to   = module.aws_ecs_task_definition_this.aws_ecs_task_definition.this
}
