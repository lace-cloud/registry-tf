module "aws_route53_record_this" {
  source                             = "./aws_route53_record_this"
  alias____null____1______           = var.alias != null ? [1] : []
  alias____null___null___var_records = var.alias != null ? null : var.records
  alias____null___null___var_ttl     = var.alias != null ? null : var.ttl
  alias_evaluate_target_health       = var.alias.evaluate_target_health
  alias_name                         = var.alias.name
  alias_zone_id                      = var.alias.zone_id
  allow_overwrite                    = var.allow_overwrite
  name                               = var.name
  type                               = var.type
  zone_id                            = var.zone_id
}
moved {
  from = aws_route53_record.this
  to   = module.aws_route53_record_this.aws_route53_record.this
}
