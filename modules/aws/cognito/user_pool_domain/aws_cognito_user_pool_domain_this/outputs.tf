output "this_cloudfront_distribution_arn" {
  value = aws_cognito_user_pool_domain.this.cloudfront_distribution_arn
}
output "this_domain" {
  value = aws_cognito_user_pool_domain.this.domain
}
