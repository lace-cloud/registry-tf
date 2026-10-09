output "arn" {
  description = "The ARN of the bucket"
  value       = module.aws_s3_bucket_this.this_arn
}
output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.aws_s3_bucket_this.this_bucket_domain_name
}
output "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name"
  value       = module.aws_s3_bucket_this.this_bucket_regional_domain_name
}
output "id" {
  description = "The name of the bucket"
  value       = module.aws_s3_bucket_this.this_id
}
