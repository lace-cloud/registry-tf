resource "aws_route53_record" "this" {
  allow_overwrite = var.allow_overwrite
  name            = var.name
  records         = var.alias____null___null___var_records
  ttl             = var.alias____null___null___var_ttl
  type            = var.type
  zone_id         = var.zone_id
  dynamic "alias" {
    for_each = var.alias____null____1______
    content {
      name                   = var.alias_name
      zone_id                = var.alias_zone_id
      evaluate_target_health = var.alias_evaluate_target_health
    }
  }
}
