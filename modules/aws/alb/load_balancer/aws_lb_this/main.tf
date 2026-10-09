resource "aws_lb" "this" {
  enable_deletion_protection = var.enable_deletion_protection
  internal                   = var.internal
  load_balancer_type         = "application"
  name                       = var.name
  security_groups            = var.security_group_ids
  subnets                    = var.subnet_ids
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
  dynamic "access_logs" {
    for_each = var.access_logs_bucket____null____1______
    content {
      bucket  = var.access_logs_bucket
      prefix  = var.access_logs_prefix
      enabled = true
    }
  }
}
