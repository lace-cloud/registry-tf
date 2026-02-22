output "id" {
  description = "The ID of the ECS service"
  value       = aws_ecs_service.this.id
}

output "name" {
  description = "The name of the ECS service"
  value       = aws_ecs_service.this.name
}

output "cluster" {
  description = "The cluster ARN of the ECS service"
  value       = aws_ecs_service.this.cluster
}
