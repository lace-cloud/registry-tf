resource "aws_iam_role" "this" {
  name               = var.name_test
  assume_role_policy = var.assume_role_policy

  tags = var.tags
}
