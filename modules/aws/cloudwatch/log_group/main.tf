module "aws_cloudwatch_log_group_this" {
  source            = "./aws_cloudwatch_log_group_this"
  kms_key_id        = var.kms_key_id
  log_group_class   = var.log_group_class
  name              = var.name
  retention_in_days = var.retention_in_days
  skip_destroy      = var.skip_destroy
  tags              = var.tags
}
moved {
  from = aws_cloudwatch_log_group.this
  to   = module.aws_cloudwatch_log_group_this.aws_cloudwatch_log_group.this
}
