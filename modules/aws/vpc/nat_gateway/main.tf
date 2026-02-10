resource "aws_eip" "this" {
  count  = var.connectivity_type == "public" && var.allocation_id == null ? 1 : 0
  domain = "vpc"

  tags = merge(
    {
      Name = "${var.name}-eip"
    },
    var.tags
  )
}

resource "aws_nat_gateway" "this" {
  subnet_id         = var.subnet_id
  allocation_id     = var.connectivity_type == "public" ? coalesce(var.allocation_id, try(aws_eip.this[0].id, null)) : null
  connectivity_type = var.connectivity_type

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
