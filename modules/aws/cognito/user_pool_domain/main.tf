module "aws_cognito_user_pool_domain_this" {
  source       = "./aws_cognito_user_pool_domain_this"
  domain       = var.domain
  user_pool_id = var.user_pool_id
}
moved {
  from = aws_cognito_user_pool_domain.this
  to   = module.aws_cognito_user_pool_domain_this.aws_cognito_user_pool_domain.this
}
