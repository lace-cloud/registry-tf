resource "aws_s3_bucket_versioning" "this" {
  bucket = var.bucket_name

  versioning_configuration {
    status = "Enabled"
  }
}
