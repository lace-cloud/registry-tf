output "attachment_id" {
  description = "The ID of the IAM role policy attachment"
  value       = module.aws_iam_role_policy_attachment_this.this_id
}
