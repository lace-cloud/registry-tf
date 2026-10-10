output "log_group_arn" {
  description = "ARN of the CloudWatch log group"
  value       = module.aws_cloudwatch_log_group_this.this_arn
}
output "log_group_name" {
  description = "Name of the CloudWatch log group"
  value       = module.aws_cloudwatch_log_group_this.this_name
}
