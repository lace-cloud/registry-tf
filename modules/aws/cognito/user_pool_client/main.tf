module "aws_cognito_user_pool_client_this" {
  source                                                         = "./aws_cognito_user_pool_client_this"
  access_token_validity                                          = var.access_token_validity
  allowed_oauth_flows                                            = var.allowed_oauth_flows
  allowed_oauth_flows_user_pool_client                           = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_scopes                                           = var.allowed_oauth_scopes
  callback_urls                                                  = var.callback_urls
  generate_secret                                                = var.generate_secret
  id_token_validity                                              = var.id_token_validity
  logout_urls                                                    = var.logout_urls
  name                                                           = var.name
  refresh_token_validity                                         = var.refresh_token_validity
  supported_identity_providers                                   = var.supported_identity_providers
  token_validity_units____null____var_token_validity_units______ = var.token_validity_units != null ? [var.token_validity_units] : []
  user_pool_id                                                   = var.user_pool_id
}
moved {
  from = aws_cognito_user_pool_client.this
  to   = module.aws_cognito_user_pool_client_this.aws_cognito_user_pool_client.this
}
