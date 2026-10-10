output "policy_arn" {
  description = "The ARN of the IAM policy"
  value       = module.aws_iam_policy_this.this_arn
}
