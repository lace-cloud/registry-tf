output "bucket_id" {
  description = "ID (name) of the S3 content bucket"
  value       = module.content_bucket.bucket_id
}

output "bucket_arn" {
  description = "ARN of the S3 content bucket"
  value       = module.content_bucket.bucket_arn
}

output "distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = module.cdn.distribution_id
}

output "distribution_arn" {
  description = "ARN of the CloudFront distribution"
  value       = module.cdn.distribution_arn
}

output "distribution_domain_name" {
  description = "CloudFront domain name (e.g., d1abc.cloudfront.net)"
  value       = module.cdn.distribution_domain_name
}

output "distribution_hosted_zone_id" {
  description = "Route 53 hosted zone ID for the CloudFront distribution (for alias records)"
  value       = module.cdn.distribution_hosted_zone_id
}

output "oai_iam_arn" {
  description = "IAM ARN of the Origin Access Identity"
  value       = aws_cloudfront_origin_access_identity.this.iam_arn
}
