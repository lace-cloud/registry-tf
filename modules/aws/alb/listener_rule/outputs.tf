output "arn" {
  description = "The ARN of the listener rule"
  value       = module.aws_lb_listener_rule_this.this_arn
}
output "id" {
  description = "The ID of the listener rule"
  value       = module.aws_lb_listener_rule_this.this_id
}
