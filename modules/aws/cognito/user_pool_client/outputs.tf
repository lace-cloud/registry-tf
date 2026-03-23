output "id" {
  description = "The ID of the Cognito user pool client"
  value       = aws_cognito_user_pool_client.this.id
}

output "client_secret" {
  description = "The client secret (only set if generate_secret is true)"
  value       = aws_cognito_user_pool_client.this.client_secret
  sensitive   = true
}
