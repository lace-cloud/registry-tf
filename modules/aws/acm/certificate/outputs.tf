output "arn" {
  description = "The ARN of the ACM certificate"
  value       = module.aws_acm_certificate_this.this_arn
}
output "domain_validation_options" {
  description = "Set of domain validation objects used to complete DNS validation"
  value       = module.aws_acm_certificate_this.this_domain_validation_options
}
output "status" {
  description = "The status of the certificate"
  value       = module.aws_acm_certificate_this.this_status
}
