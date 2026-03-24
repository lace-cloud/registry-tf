output "id" {
  description = "The ID of the role policy attachment"
  value       = aws_iam_role_policy_attachment.this.id
}
