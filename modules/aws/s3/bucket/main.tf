module "aws_s3_bucket_cors_configuration_this" {
  source     = "./aws_s3_bucket_cors_configuration_this"
  cors_rules = var.cors_rules
  this_id    = module.aws_s3_bucket_this.this_id
}
module "aws_s3_bucket_lifecycle_configuration_this" {
  source                          = "./aws_s3_bucket_lifecycle_configuration_this"
  lifecycle_rules                 = var.lifecycle_rules
  lifecycle_rules____null___1___0 = var.lifecycle_rules != null ? 1 : 0
  this_id                         = module.aws_s3_bucket_this.this_id
}
module "aws_s3_bucket_public_access_block_this" {
  source  = "./aws_s3_bucket_public_access_block_this"
  this_id = module.aws_s3_bucket_this.this_id
}
module "aws_s3_bucket_server_side_encryption_configuration_this" {
  source                                    = "./aws_s3_bucket_server_side_encryption_configuration_this"
  kms_key_id                                = var.kms_key_id
  kms_key_id____null____aws_kms_____AES256_ = var.kms_key_id != null ? "aws:kms" : "AES256"
  kms_key_id____null___true___false         = var.kms_key_id != null ? true : false
  this_id                                   = module.aws_s3_bucket_this.this_id
}
module "aws_s3_bucket_this" {
  source = "./aws_s3_bucket_this"
  bucket = var.bucket
  tags   = var.tags
}
module "aws_s3_bucket_versioning_this" {
  source                                       = "./aws_s3_bucket_versioning_this"
  this_id                                      = module.aws_s3_bucket_this.this_id
  versioning_enabled____Enabled_____Suspended_ = var.versioning_enabled ? "Enabled" : "Suspended"
}
moved {
  from = aws_s3_bucket.this
  to   = module.aws_s3_bucket_this.aws_s3_bucket.this
}
moved {
  from = aws_s3_bucket_cors_configuration.this
  to   = module.aws_s3_bucket_cors_configuration_this.aws_s3_bucket_cors_configuration.this
}
moved {
  from = aws_s3_bucket_lifecycle_configuration.this
  to   = module.aws_s3_bucket_lifecycle_configuration_this.aws_s3_bucket_lifecycle_configuration.this
}
moved {
  from = aws_s3_bucket_public_access_block.this
  to   = module.aws_s3_bucket_public_access_block_this.aws_s3_bucket_public_access_block.this
}
moved {
  from = aws_s3_bucket_server_side_encryption_configuration.this
  to   = module.aws_s3_bucket_server_side_encryption_configuration_this.aws_s3_bucket_server_side_encryption_configuration.this
}
moved {
  from = aws_s3_bucket_versioning.this
  to   = module.aws_s3_bucket_versioning_this.aws_s3_bucket_versioning.this
}
