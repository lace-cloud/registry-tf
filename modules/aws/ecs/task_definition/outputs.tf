output "arn" {
  description = "The full ARN of the task definition"
  value       = aws_ecs_task_definition.this.arn
}

output "revision" {
  description = "The revision number of the task definition"
  value       = aws_ecs_task_definition.this.revision
}

output "family" {
  description = "The family of the task definition"
  value       = aws_ecs_task_definition.this.family
}
