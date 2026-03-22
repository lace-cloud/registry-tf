output "id" {
  description = "The ID of the ALB"
  value       = aws_lb.this.id
}

output "arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.this.arn
}

output "dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.this.dns_name
}

output "zone_id" {
  description = "The canonical hosted zone ID of the ALB"
  value       = aws_lb.this.zone_id
}
