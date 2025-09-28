resource "aws_ecs_task_definition" "this" {
  family                   = var.task_def_name
  task_role_arn            = var.ecs_task_role_arn
  execution_role_arn       = var.ecs_execution_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  container_definitions    = jsonencode([
    {
      name=var.container_name
      image=var.image_uri
      cpu=var.ecs_task_cpu
      memory= var.ecs_task_memory
      essential=true
      portMappings=var.container_port_mappings

    }
  ])
  
  tags=merge(
    var.tags,
    var.optional_tags,
    tomap({
      Name="${var.task_def_name}-${var.environment_name}"
    })
  )
}
