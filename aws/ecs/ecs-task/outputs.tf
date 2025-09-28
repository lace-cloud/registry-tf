output "ecs_task_def_arn" {
  description = "ARN of the created ECS Task Definition"
  value       = aws_ecs_task_definition.this.arn
}

output "ecs_task_def_revision" {
  description = "Revision of the ECS Task Definition"
  value       = aws_ecs_task_definition.this.revision
}


output "ecs_task_def_arn_without_revision" {
  description = "Revision of the ECS Task Definition"
  value       = aws_ecs_task_definition.this.arn_without_revision
}
