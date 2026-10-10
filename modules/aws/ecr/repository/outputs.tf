output "registry_id" {
  description = "Registry ID"
  value       = module.aws_ecr_repository_this.this_registry_id
}
output "repository_arn" {
  description = "ARN of the ECR repository"
  value       = module.aws_ecr_repository_this.this_arn
}
output "repository_name" {
  description = "Name of the ECR repository"
  value       = module.aws_ecr_repository_this.this_name
}
output "repository_url" {
  description = "URL of the ECR repository"
  value       = module.aws_ecr_repository_this.this_repository_url
}
