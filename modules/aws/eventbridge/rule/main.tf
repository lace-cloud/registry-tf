resource "aws_cloudwatch_event_rule" "this" {
  name                = var.name
  description         = var.description
  schedule_expression = var.schedule_expression
  event_pattern       = var.event_pattern
  state               = var.state
  event_bus_name      = var.event_bus_name

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

resource "aws_cloudwatch_event_target" "this" {
  for_each = { for idx, target in var.targets : idx => target }

  rule           = aws_cloudwatch_event_rule.this.name
  arn            = each.value.arn
  target_id      = lookup(each.value, "target_id", null)
  input          = lookup(each.value, "input", null)
  input_path     = lookup(each.value, "input_path", null)
  role_arn       = lookup(each.value, "role_arn", null)
  event_bus_name = var.event_bus_name
}
