output "arn" {
  description = "The ARN of the listener"
  value       = module.aws_lb_listener_this.this_arn
}
output "id" {
  description = "The ID of the listener"
  value       = module.aws_lb_listener_this.this_id
}
