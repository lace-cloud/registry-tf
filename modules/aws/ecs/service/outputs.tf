output "cluster" {
  description = "The cluster ARN of the ECS service"
  value       = module.aws_ecs_service_this.this_cluster
}
output "id" {
  description = "The ID of the ECS service"
  value       = module.aws_ecs_service_this.this_id
}
output "name" {
  description = "The name of the ECS service"
  value       = module.aws_ecs_service_this.this_name
}
