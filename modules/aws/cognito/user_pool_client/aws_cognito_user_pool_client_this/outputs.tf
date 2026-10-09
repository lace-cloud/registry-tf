output "this_client_secret" {
  value = aws_cognito_user_pool_client.this.client_secret
}
output "this_id" {
  value = aws_cognito_user_pool_client.this.id
}
