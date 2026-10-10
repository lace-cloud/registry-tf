module "aws_acm_certificate_this" {
  source                    = "./aws_acm_certificate_this"
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  tags                      = var.tags
  validation_method         = var.validation_method
}
moved {
  from = aws_acm_certificate.this
  to   = module.aws_acm_certificate_this.aws_acm_certificate.this
}
