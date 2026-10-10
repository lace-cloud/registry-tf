resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = var.this_id
  rule {
    bucket_key_enabled = var.kms_key_id____null___true___false
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.kms_key_id____null____aws_kms_____AES256_
      kms_master_key_id = var.kms_key_id
    }
  }
}
