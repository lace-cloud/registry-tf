module "aws_cloudwatch_metric_alarm_this" {
  source                    = "./aws_cloudwatch_metric_alarm_this"
  alarm_actions             = var.alarm_actions
  alarm_description         = var.alarm_description
  alarm_name                = var.alarm_name
  comparison_operator       = var.comparison_operator
  datapoints_to_alarm       = var.datapoints_to_alarm
  dimensions                = var.dimensions
  evaluation_periods        = var.evaluation_periods
  insufficient_data_actions = var.insufficient_data_actions
  metric_name               = var.metric_name
  namespace                 = var.namespace
  ok_actions                = var.ok_actions
  period                    = var.period
  statistic                 = var.statistic
  tags                      = var.tags
  threshold                 = var.threshold
  treat_missing_data        = var.treat_missing_data
}
moved {
  from = aws_cloudwatch_metric_alarm.this
  to   = module.aws_cloudwatch_metric_alarm_this.aws_cloudwatch_metric_alarm.this
}
