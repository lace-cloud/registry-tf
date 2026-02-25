resource "aws_kms_key" "this" {
  description              = var.description
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = var.enable_key_rotation
  policy                   = var.policy
  is_enabled               = var.is_enabled
  multi_region             = var.multi_region

  tags = merge(
    {
      Name = var.alias
    },
    var.tags
  )
}

resource "aws_kms_alias" "this" {
  count         = var.alias != null ? 1 : 0
  name          = var.alias
  target_key_id = aws_kms_key.this.key_id
}
