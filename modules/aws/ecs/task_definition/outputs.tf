output "arn" {
  description = "The full ARN of the task definition"
  value       = module.aws_ecs_task_definition_this.this_arn
}
output "family" {
  description = "The family of the task definition"
  value       = module.aws_ecs_task_definition_this.this_family
}
output "revision" {
  description = "The revision number of the task definition"
  value       = module.aws_ecs_task_definition_this.this_revision
}
