output "fqdn" {
  description = "The FQDN built using the zone domain and name"
  value       = aws_route53_record.this.fqdn
}

output "name" {
  description = "The name of the DNS record"
  value       = aws_route53_record.this.name
}
