module "aws_ecr_lifecycle_policy_this" {
  source          = "./aws_ecr_lifecycle_policy_this"
  lifecycle_rules = var.lifecycle_rules
  this_name       = module.aws_ecr_repository_this.this_name
}
module "aws_ecr_repository_this" {
  source                             = "./aws_ecr_repository_this"
  encryption_type                    = var.encryption_type
  encryption_type____null____1______ = var.encryption_type != null ? [1] : []
  force_delete                       = var.force_delete
  image_tag_mutability               = var.image_tag_mutability
  kms_key                            = var.kms_key
  name                               = var.name
  scan_on_push                       = var.scan_on_push
  tags                               = var.tags
}
moved {
  from = aws_ecr_lifecycle_policy.this
  to   = module.aws_ecr_lifecycle_policy_this.aws_ecr_lifecycle_policy.this
}
moved {
  from = aws_ecr_repository.this
  to   = module.aws_ecr_repository_this.aws_ecr_repository.this
}
