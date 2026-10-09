output "arn" {
  description = "The ARN of the secret"
  value       = module.aws_secretsmanager_secret_this.this_arn
}
output "id" {
  description = "The ID of the secret"
  value       = module.aws_secretsmanager_secret_this.this_id
}
output "name" {
  description = "The name of the secret"
  value       = module.aws_secretsmanager_secret_this.this_name
}
