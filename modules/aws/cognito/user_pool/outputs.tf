output "arn" {
  description = "The ARN of the Cognito user pool"
  value       = module.aws_cognito_user_pool_this.this_arn
}
output "endpoint" {
  description = "The endpoint name of the user pool"
  value       = module.aws_cognito_user_pool_this.this_endpoint
}
output "id" {
  description = "The ID of the Cognito user pool"
  value       = module.aws_cognito_user_pool_this.this_id
}
