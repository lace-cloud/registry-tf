output "this_arn" {
  value = aws_ecs_task_definition.this.arn
}
output "this_family" {
  value = aws_ecs_task_definition.this.family
}
output "this_revision" {
  value = aws_ecs_task_definition.this.revision
}
