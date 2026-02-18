output "queue_url" {
  description = "URL of the SQS queue receiving EventBridge events"
  value       = module.event_queue.queue_url
}

output "queue_arn" {
  description = "ARN of the SQS queue"
  value       = module.event_queue.queue_arn
}

output "queue_name" {
  description = "Name of the SQS queue"
  value       = module.event_queue.queue_name
}

output "rule_arn" {
  description = "ARN of the EventBridge rule"
  value       = module.rule.rule_arn
}

output "rule_name" {
  description = "Name of the EventBridge rule"
  value       = module.rule.rule_name
}

output "log_group_name" {
  description = "CloudWatch log group name for EventBridge observability"
  value       = module.log_group.log_group_name
}

output "log_group_arn" {
  description = "ARN of the CloudWatch log group"
  value       = module.log_group.log_group_arn
}
