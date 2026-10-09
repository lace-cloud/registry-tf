module "aws_security_group_this" {
  source        = "./aws_security_group_this"
  description   = var.description
  egress_rules  = var.egress_rules
  ingress_rules = var.ingress_rules
  name          = var.name
  tags          = var.tags
  vpc_id        = var.vpc_id
}
moved {
  from = aws_security_group.this
  to   = module.aws_security_group_this.aws_security_group.this
}
