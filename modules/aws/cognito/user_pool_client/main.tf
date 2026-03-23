resource "aws_cognito_user_pool_client" "this" {
  name         = var.name
  user_pool_id = var.user_pool_id

  generate_secret = var.generate_secret

  allowed_oauth_flows                  = var.allowed_oauth_flows
  allowed_oauth_scopes                 = var.allowed_oauth_scopes
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  supported_identity_providers         = var.supported_identity_providers

  callback_urls = length(var.callback_urls) > 0 ? var.callback_urls : null
  logout_urls   = length(var.logout_urls) > 0 ? var.logout_urls : null

  access_token_validity  = var.access_token_validity
  id_token_validity      = var.id_token_validity
  refresh_token_validity = var.refresh_token_validity

  dynamic "token_validity_units" {
    for_each = var.token_validity_units != null ? [var.token_validity_units] : []
    content {
      access_token  = lookup(token_validity_units.value, "access_token", "hours")
      id_token      = lookup(token_validity_units.value, "id_token", "hours")
      refresh_token = lookup(token_validity_units.value, "refresh_token", "days")
    }
  }
}
