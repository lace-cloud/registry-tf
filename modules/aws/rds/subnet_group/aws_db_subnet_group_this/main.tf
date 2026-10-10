resource "aws_db_subnet_group" "this" {
  description = var.description
  name        = var.name
  subnet_ids  = var.subnet_ids
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
