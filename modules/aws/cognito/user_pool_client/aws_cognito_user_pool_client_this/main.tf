resource "aws_cognito_user_pool_client" "this" {
  access_token_validity                = var.access_token_validity
  allowed_oauth_flows                  = var.allowed_oauth_flows
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_scopes                 = var.allowed_oauth_scopes
  callback_urls                        = length(var.callback_urls) > 0 ? var.callback_urls : null
  generate_secret                      = var.generate_secret
  id_token_validity                    = var.id_token_validity
  logout_urls                          = length(var.logout_urls) > 0 ? var.logout_urls : null
  name                                 = var.name
  refresh_token_validity               = var.refresh_token_validity
  supported_identity_providers         = var.supported_identity_providers
  user_pool_id                         = var.user_pool_id
  dynamic "token_validity_units" {
    for_each = var.token_validity_units____null____var_token_validity_units______
    content {
      access_token  = lookup(token_validity_units.value, "access_token", "hours")
      id_token      = lookup(token_validity_units.value, "id_token", "hours")
      refresh_token = lookup(token_validity_units.value, "refresh_token", "days")
    }
  }
}
