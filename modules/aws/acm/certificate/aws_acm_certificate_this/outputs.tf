output "this_arn" {
  value = aws_acm_certificate.this.arn
}
output "this_domain_validation_options" {
  value = aws_acm_certificate.this.domain_validation_options
}
output "this_status" {
  value = aws_acm_certificate.this.status
}
