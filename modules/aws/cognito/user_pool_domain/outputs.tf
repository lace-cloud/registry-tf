output "domain" {
  description = "The Cognito hosted UI domain"
  value       = aws_cognito_user_pool_domain.this.domain
}

output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution backing the hosted UI"
  value       = aws_cognito_user_pool_domain.this.cloudfront_distribution_arn
}
