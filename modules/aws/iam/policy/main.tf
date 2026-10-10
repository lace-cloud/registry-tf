module "aws_iam_policy_this" {
  source          = "./aws_iam_policy_this"
  policy_document = var.policy_document
  policy_name     = var.policy_name
  tags            = var.tags
}
moved {
  from = aws_iam_policy.this
  to   = module.aws_iam_policy_this.aws_iam_policy.this
}
