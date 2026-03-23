resource "aws_cognito_user_pool" "this" {
  name                     = var.name
  username_attributes      = var.username_attributes
  auto_verified_attributes = var.auto_verified_attributes

  dynamic "password_policy" {
    for_each = var.password_policy != null ? [var.password_policy] : []
    content {
      minimum_length                   = password_policy.value.minimum_length
      require_lowercase                = password_policy.value.require_lowercase
      require_uppercase                = password_policy.value.require_uppercase
      require_numbers                  = password_policy.value.require_numbers
      require_symbols                  = password_policy.value.require_symbols
      temporary_password_validity_days = password_policy.value.temporary_password_validity_days
    }
  }

  dynamic "account_recovery_setting" {
    for_each = var.recovery_mechanisms != null ? [1] : []
    content {
      dynamic "recovery_mechanism" {
        for_each = var.recovery_mechanisms
        content {
          name     = recovery_mechanism.value.name
          priority = recovery_mechanism.value.priority
        }
      }
    }
  }

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
