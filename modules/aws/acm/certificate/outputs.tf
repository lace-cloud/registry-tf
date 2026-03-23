output "arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.this.arn
}

output "domain_validation_options" {
  description = "Set of domain validation objects used to complete DNS validation"
  value       = aws_acm_certificate.this.domain_validation_options
}

output "status" {
  description = "The status of the certificate"
  value       = aws_acm_certificate.this.status
}
