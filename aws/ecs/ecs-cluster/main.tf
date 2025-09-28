resource "aws_ecs_cluster" "this" {
  name = "${var.ecs_cluster_name}-${var.environment_name}"

  setting {
    name= "containerInsights"
    value= var.settings_value
  }
  tags=merge(
    var.tags,
    var.optional_tags,
    tomap({
      Name="${var.ecs_cluster_name}-${var.environment_name}"
    })
  )

}


