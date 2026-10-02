resource "aws_cloudwatch_log_group" "this" {
  kms_key_id        = var.kms_key_id
  log_group_class   = var.log_group_class
  name              = var.name
  retention_in_days = var.retention_in_days
  skip_destroy      = var.skip_destroy
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
