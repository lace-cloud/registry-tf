module "aws_cognito_user_pool_this" {
  source                                               = "./aws_cognito_user_pool_this"
  auto_verified_attributes                             = var.auto_verified_attributes
  name                                                 = var.name
  password_policy____null____var_password_policy______ = var.password_policy != null ? [var.password_policy] : []
  recovery_mechanisms                                  = var.recovery_mechanisms
  recovery_mechanisms____null____1______               = var.recovery_mechanisms != null ? [1] : []
  tags                                                 = var.tags
  username_attributes                                  = var.username_attributes
}
moved {
  from = aws_cognito_user_pool.this
  to   = module.aws_cognito_user_pool_this.aws_cognito_user_pool.this
}
