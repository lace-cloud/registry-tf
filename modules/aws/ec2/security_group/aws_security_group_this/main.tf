resource "aws_security_group" "this" {
  description = var.description
  name        = var.name
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = lookup(ingress.value, "cidr_blocks", null)
      security_groups = lookup(ingress.value, "security_groups", null)
      self            = lookup(ingress.value, "self", null)
      description     = lookup(ingress.value, "description", null)
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      cidr_blocks     = lookup(egress.value, "cidr_blocks", null)
      security_groups = lookup(egress.value, "security_groups", null)
      self            = lookup(egress.value, "self", null)
      description     = lookup(egress.value, "description", null)
    }
  }
}
