output "arn" {
  description = "The ARN of the ECS cluster"
  value       = module.aws_ecs_cluster_this.this_arn
}
output "id" {
  description = "The ID of the ECS cluster"
  value       = module.aws_ecs_cluster_this.this_id
}
output "name" {
  description = "The name of the ECS cluster"
  value       = module.aws_ecs_cluster_this.this_name
}
