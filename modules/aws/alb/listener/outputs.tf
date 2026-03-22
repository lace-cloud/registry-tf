output "id" {
  description = "The ID of the listener"
  value       = aws_lb_listener.this.id
}

output "arn" {
  description = "The ARN of the listener"
  value       = aws_lb_listener.this.arn
}
