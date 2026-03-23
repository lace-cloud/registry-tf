output "id" {
  description = "The ID of the Cognito user pool"
  value       = aws_cognito_user_pool.this.id
}

output "arn" {
  description = "The ARN of the Cognito user pool"
  value       = aws_cognito_user_pool.this.arn
}

output "endpoint" {
  description = "The endpoint name of the user pool"
  value       = aws_cognito_user_pool.this.endpoint
}
