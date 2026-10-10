module "aws_lb_listener_this" {
  source                                                                        = "./aws_lb_listener_this"
  default_action_type                                                           = var.default_action_type
  default_action_type_____fixed_response_____1______                            = var.default_action_type == "fixed-response" ? [1] : []
  default_action_type_____forward____var_default_action_target_group_arn___null = var.default_action_type == "forward" ? var.default_action_target_group_arn : null
  fixed_response_content_type                                                   = var.fixed_response_content_type
  fixed_response_message_body                                                   = var.fixed_response_message_body
  fixed_response_status_code                                                    = var.fixed_response_status_code
  load_balancer_arn                                                             = var.load_balancer_arn
  name                                                                          = var.name
  port                                                                          = var.port
  protocol                                                                      = var.protocol
  protocol_____HTTPS____var_certificate_arn___null                              = var.protocol == "HTTPS" ? var.certificate_arn : null
  protocol_____HTTPS____var_ssl_policy___null                                   = var.protocol == "HTTPS" ? var.ssl_policy : null
  tags                                                                          = var.tags
}
moved {
  from = aws_lb_listener.this
  to   = module.aws_lb_listener_this.aws_lb_listener.this
}
