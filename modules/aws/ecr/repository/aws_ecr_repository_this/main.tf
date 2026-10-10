resource "aws_ecr_repository" "this" {
  force_delete         = var.force_delete
  image_tag_mutability = var.image_tag_mutability
  name                 = var.name
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  dynamic "encryption_configuration" {
    for_each = var.encryption_type____null____1______
    content {
      encryption_type = var.encryption_type
      kms_key         = var.kms_key
    }
  }
}
