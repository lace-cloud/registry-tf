resource "aws_ecs_service" "this" {
  cluster       = var.cluster_id
  desired_count = var.desired_count
  launch_type   = var.launch_type
  name          = var.name
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
  task_definition = var.task_definition
  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.security_group_ids
    assign_public_ip = var.assign_public_ip
  }
  dynamic "load_balancer" {
    for_each = var.target_group_arn____null____1______
    content {
      target_group_arn = var.target_group_arn
      container_name   = var.container_name
      container_port   = var.container_port
    }
  }
}
