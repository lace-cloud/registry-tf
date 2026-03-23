output "id" {
  description = "The ID of the secret"
  value       = aws_secretsmanager_secret.this.id
}

output "arn" {
  description = "The ARN of the secret"
  value       = aws_secretsmanager_secret.this.arn
}

output "name" {
  description = "The name of the secret"
  value       = aws_secretsmanager_secret.this.name
}
