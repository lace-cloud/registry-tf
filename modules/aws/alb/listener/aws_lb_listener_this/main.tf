resource "aws_lb_listener" "this" {
  certificate_arn   = var.protocol_____HTTPS____var_certificate_arn___null
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = var.protocol
  ssl_policy        = var.protocol_____HTTPS____var_ssl_policy___null
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
  default_action {
    type             = var.default_action_type
    target_group_arn = var.default_action_type_____forward____var_default_action_target_group_arn___null
    dynamic "fixed_response" {
      for_each = var.default_action_type_____fixed_response_____1______
      content {
        content_type = var.fixed_response_content_type
        message_body = var.fixed_response_message_body
        status_code  = var.fixed_response_status_code
      }
    }
  }
}
