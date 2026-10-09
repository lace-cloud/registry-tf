module "aws_db_subnet_group_this" {
  source      = "./aws_db_subnet_group_this"
  description = var.description
  name        = var.name
  subnet_ids  = var.subnet_ids
  tags        = var.tags
}
moved {
  from = aws_db_subnet_group.this
  to   = module.aws_db_subnet_group_this.aws_db_subnet_group.this
}
