resource "aws_s3_bucket_public_access_block" "this" {
  block_public_acls       = true
  block_public_policy     = true
  bucket                  = var.this_id
  ignore_public_acls      = true
  restrict_public_buckets = true
}
