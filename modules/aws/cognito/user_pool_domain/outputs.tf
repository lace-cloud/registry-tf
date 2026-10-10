output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution backing the hosted UI"
  value       = module.aws_cognito_user_pool_domain_this.this_cloudfront_distribution_arn
}
output "domain" {
  description = "The Cognito hosted UI domain"
  value       = module.aws_cognito_user_pool_domain_this.this_domain
}
