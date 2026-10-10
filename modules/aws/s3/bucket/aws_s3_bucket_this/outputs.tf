output "this_arn" {
  value = aws_s3_bucket.this.arn
}
output "this_bucket_domain_name" {
  value = aws_s3_bucket.this.bucket_domain_name
}
output "this_bucket_regional_domain_name" {
  value = aws_s3_bucket.this.bucket_regional_domain_name
}
output "this_id" {
  value = aws_s3_bucket.this.id
}
