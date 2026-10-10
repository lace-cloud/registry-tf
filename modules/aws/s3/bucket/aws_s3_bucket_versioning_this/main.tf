resource "aws_s3_bucket_versioning" "this" {
  bucket = var.this_id
  versioning_configuration {
    status = var.versioning_enabled____Enabled_____Suspended_
  }
}
