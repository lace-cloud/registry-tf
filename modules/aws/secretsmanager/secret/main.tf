module "aws_secretsmanager_secret_this" {
  source                  = "./aws_secretsmanager_secret_this"
  description             = var.description
  kms_key_id              = var.kms_key_id
  name                    = var.name
  recovery_window_in_days = var.recovery_window_in_days
  tags                    = var.tags
}
module "aws_secretsmanager_secret_version_this" {
  source                        = "./aws_secretsmanager_secret_version_this"
  secret_string                 = var.secret_string
  secret_string____null___1___0 = var.secret_string != null ? 1 : 0
  this_id                       = module.aws_secretsmanager_secret_this.this_id
}
moved {
  from = aws_secretsmanager_secret.this
  to   = module.aws_secretsmanager_secret_this.aws_secretsmanager_secret.this
}
moved {
  from = aws_secretsmanager_secret_version.this
  to   = module.aws_secretsmanager_secret_version_this.aws_secretsmanager_secret_version.this
}
