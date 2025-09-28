resource "aws_lb" "this" {
  name               = "${var.lb_name}-${var.environment_name}"
  internal           = var.lb_internal
  load_balancer_type = var.lb_type
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids
  enable_deletion_protection=false
  tags=merge(
    var.tags,
    var.optional_tags,
    tomap({
      Name="${var.lb_name}-${var.environment_name}"
    })
  )
}

resource "aws_lb_target_group" "this" {
  name     = "${var.lb_tg_name}-${var.environment_name}"
  port     = var.lb_tg_port
  protocol = var.lb_tg_protocol
  vpc_id   = var.vpc_id
  target_type=var.lb_tg_target_type
  health_check{
    healthy_threshold="2"
    interval="300"
    protocol="HTTP"
    matcher="200"
    timeout="5"
    path="/"
    unhealthy_threshold="2"

  }
  tags=merge(
    var.tags,
    var.optional_tags,
    tomap({
      Name="${var.lb_tg_name}-${var.environment_name}"
    })
  )
}

resource "aws_alb_listener" "this"{
  load_balancer_arn= aws_lb.this.arn 
  protocol= var.lb_listener_protocol
  port=var.lb_listener_port
  default_action{
    type=var.lb_listener_action_type
    target_group_arn=aws_lb_target_group.this.id
  }
  tags=merge(
    var.tags,
    var.optional_tags,
    tomap({
      Name="${var.lb_tg_name}-${var.environment_name}"
    })
  )
}


