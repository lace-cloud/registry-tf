module "aws_iam_role_policy_attachment_this" {
  source     = "./aws_iam_role_policy_attachment_this"
  policy_arn = var.policy_arn
  role_name  = var.role_name
}
moved {
  from = aws_iam_role_policy_attachment.this
  to   = module.aws_iam_role_policy_attachment_this.aws_iam_role_policy_attachment.this
}
