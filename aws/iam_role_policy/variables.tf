variable "name" {
  description = "Resource name"
  type        = string
}

variable "aws_iam_role_id" {
  description = "AWS IAM Role ID"
  type        = string
}

variable "policy" {
  description = "IAM Policy Document"
  type        = map(any)
}
