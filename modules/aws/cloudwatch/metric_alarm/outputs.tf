output "alarm_arn" {
  description = "ARN of the CloudWatch metric alarm"
  value       = module.aws_cloudwatch_metric_alarm_this.this_arn
}
output "alarm_id" {
  description = "ID of the CloudWatch metric alarm"
  value       = module.aws_cloudwatch_metric_alarm_this.this_id
}
output "alarm_name" {
  description = "Name of the CloudWatch metric alarm"
  value       = module.aws_cloudwatch_metric_alarm_this.this_alarm_name
}
