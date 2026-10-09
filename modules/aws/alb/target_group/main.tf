module "aws_lb_target_group_this" {
  source                                         = "./aws_lb_target_group_this"
  health_check____null____var_health_check______ = var.health_check != null ? [var.health_check] : []
  name                                           = var.name
  port                                           = var.port
  protocol                                       = var.protocol
  tags                                           = var.tags
  target_type                                    = var.target_type
  vpc_id                                         = var.vpc_id
}
moved {
  from = aws_lb_target_group.this
  to   = module.aws_lb_target_group_this.aws_lb_target_group.this
}
