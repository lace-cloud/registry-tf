resource "aws_ecs_cluster" "this" {
  name = var.name
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
  setting {
    name  = "containerInsights"
    value = var.container_insights____enabled_____disabled_
  }
}
