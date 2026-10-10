output "fqdn" {
  description = "The FQDN built using the zone domain and name"
  value       = module.aws_route53_record_this.this_fqdn
}
output "name" {
  description = "The name of the DNS record"
  value       = module.aws_route53_record_this.this_name
}
