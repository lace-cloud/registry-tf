resource "aws_ecs_service" "this" {
  name            = "${var.ecs_service_name}-${var.environment_name}"
  cluster         = var.ecs_cluster_arn
  task_definition = var.ecs_task_def
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = var.lb_tg_arn
    container_name   = var.container_name_lb
    container_port   = var.container_port_lb
  }

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = var.security_group_ids
    assign_public_ip = false
  }

  tags=merge(
    var.tags,
    var.optional_tags,
    tomap({
      Name="${var.ecs_service_name}-${var.environment_name}"
    })
  )
}
