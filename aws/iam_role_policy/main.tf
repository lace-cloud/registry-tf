resource "aws_iam_role_policy" "aws_iam_role_policy" {
  name   = var.name
  role   = var.aws_iam_role_id
  policy = jsonencode(var.policy)
}
