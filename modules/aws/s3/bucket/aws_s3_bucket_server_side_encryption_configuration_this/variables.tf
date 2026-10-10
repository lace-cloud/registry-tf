variable "kms_key_id" {
  type = string
}
variable "kms_key_id____null____aws_kms_____AES256_" {
  description = "boundary crossing for var.kms_key_id != null ? \"aws:kms\" : \"AES256\""
}
variable "kms_key_id____null___true___false" {
  description = "boundary crossing for var.kms_key_id != null ? true : false"
}
variable "this_id" {
  description = "boundary crossing for aws_s3_bucket.this.id"
}
