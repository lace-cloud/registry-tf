output "nat_gateway_id" {
  description = "ID of the NAT gateway"
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_public_ip" {
  description = "Public IP of the NAT gateway"
  value       = aws_nat_gateway.this.public_ip
}

output "eip_id" {
  description = "ID of the auto-created Elastic IP (if applicable)"
  value       = try(aws_eip.this[0].id, null)
}
