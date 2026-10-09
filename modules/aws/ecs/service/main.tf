module "aws_ecs_service_this" {
  source                              = "./aws_ecs_service_this"
  assign_public_ip                    = var.assign_public_ip
  cluster_id                          = var.cluster_id
  container_name                      = var.container_name
  container_port                      = var.container_port
  desired_count                       = var.desired_count
  launch_type                         = var.launch_type
  name                                = var.name
  security_group_ids                  = var.security_group_ids
  subnet_ids                          = var.subnet_ids
  tags                                = var.tags
  target_group_arn                    = var.target_group_arn
  target_group_arn____null____1______ = var.target_group_arn != null ? [1] : []
  task_definition                     = var.task_definition
}
moved {
  from = aws_ecs_service.this
  to   = module.aws_ecs_service_this.aws_ecs_service.this
}
