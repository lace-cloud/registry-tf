output "arn" {
  description = "The ARN of the target group"
  value       = module.aws_lb_target_group_this.this_arn
}
output "id" {
  description = "The ID of the target group"
  value       = module.aws_lb_target_group_this.this_id
}
output "name" {
  description = "The name of the target group"
  value       = module.aws_lb_target_group_this.this_name
}
