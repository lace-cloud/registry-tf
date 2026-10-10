resource "aws_iam_role" "this" {
  assume_role_policy = var.assume_role_policy
  name               = var.name
  tags               = var.tags
}
