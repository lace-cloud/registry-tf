output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = aws_internet_gateway.this.id
}

output "internet_gateway_arn" {
  description = "ARN of the internet gateway"
  value       = aws_internet_gateway.this.arn
}
