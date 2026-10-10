module "this" {
  source             = "./this"
  assume_role_policy = var.assume_role_policy
  name               = var.name
  tags               = var.tags
}
moved {
  from = aws_iam_role.this
  to   = module.this.aws_iam_role.this
}
