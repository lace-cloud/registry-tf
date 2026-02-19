resource "aws_iam_policy" "this" {
  name   = var.policy_name_test
  policy = var.policy_document

  tags = var.tags
}
