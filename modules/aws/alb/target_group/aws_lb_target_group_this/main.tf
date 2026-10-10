resource "aws_lb_target_group" "this" {
  name     = var.name
  port     = var.port
  protocol = var.protocol
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
  target_type = var.target_type
  vpc_id      = var.vpc_id
  dynamic "health_check" {
    for_each = var.health_check____null____var_health_check______
    content {
      path                = lookup(health_check.value, "path", null)
      port                = lookup(health_check.value, "port", "traffic-port")
      protocol            = lookup(health_check.value, "protocol", "HTTP")
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", 3)
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", 3)
      timeout             = lookup(health_check.value, "timeout", 5)
      interval            = lookup(health_check.value, "interval", 30)
      matcher             = lookup(health_check.value, "matcher", "200")
    }
  }
}
