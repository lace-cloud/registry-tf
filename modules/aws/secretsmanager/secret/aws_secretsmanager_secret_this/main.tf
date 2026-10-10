resource "aws_secretsmanager_secret" "this" {
  description             = var.description
  kms_key_id              = var.kms_key_id
  name                    = var.name
  recovery_window_in_days = var.recovery_window_in_days
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
