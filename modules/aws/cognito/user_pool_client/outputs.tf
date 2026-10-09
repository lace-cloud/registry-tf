output "client_secret" {
  description = "The client secret (only set if generate_secret is true)"
  value       = module.aws_cognito_user_pool_client_this.this_client_secret
  sensitive   = true
}
output "id" {
  description = "The ID of the Cognito user pool client"
  value       = module.aws_cognito_user_pool_client_this.this_id
}
