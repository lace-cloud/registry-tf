output "alarm_arn" {
  description = "ARN of the CloudWatch metric alarm"
  value       = aws_cloudwatch_metric_alarm.this.arn
}

output "alarm_name" {
  description = "Name of the CloudWatch metric alarm"
  value       = aws_cloudwatch_metric_alarm.this.alarm_name
}

output "alarm_id" {
  description = "ID of the CloudWatch metric alarm"
  value       = aws_cloudwatch_metric_alarm.this.id
}
