output "sagemaker_role" {
  description = "The IAM role for SageMaker"
  value       = aws_iam_role.sagemaker_role
}

output "role_arn" {
  description = "The ARN of the SageMaker IAM role"
  value       = aws_iam_role.sagemaker_role.arn
}
