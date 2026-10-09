module "aws_lb_listener_rule_this" {
  source                                     = "./aws_lb_listener_rule_this"
  action_type_____fixed_response_____1______ = var.action_type == "fixed-response" ? [1] : []
  action_type_____forward_____1______        = var.action_type == "forward" ? [1] : []
  action_type_____redirect_____1______       = var.action_type == "redirect" ? [1] : []
  fixed_response_content_type                = var.fixed_response_content_type
  fixed_response_message_body                = var.fixed_response_message_body
  fixed_response_status_code                 = var.fixed_response_status_code
  host_headers                               = var.host_headers
  listener_arn                               = var.listener_arn
  name                                       = var.name
  path_patterns                              = var.path_patterns
  priority                                   = var.priority
  redirect_port                              = var.redirect_port
  redirect_protocol                          = var.redirect_protocol
  redirect_status_code                       = var.redirect_status_code
  tags                                       = var.tags
  target_group_arn                           = var.target_group_arn
}
moved {
  from = aws_lb_listener_rule.this
  to   = module.aws_lb_listener_rule_this.aws_lb_listener_rule.this
}
