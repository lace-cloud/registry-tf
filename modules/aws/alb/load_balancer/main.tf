module "aws_lb_this" {
  source                                = "./aws_lb_this"
  access_logs_bucket                    = var.access_logs_bucket
  access_logs_bucket____null____1______ = var.access_logs_bucket != null ? [1] : []
  access_logs_prefix                    = var.access_logs_prefix
  enable_deletion_protection            = var.enable_deletion_protection
  internal                              = var.internal
  name                                  = var.name
  security_group_ids                    = var.security_group_ids
  subnet_ids                            = var.subnet_ids
  tags                                  = var.tags
}
moved {
  from = aws_lb.this
  to   = module.aws_lb_this.aws_lb.this
}
