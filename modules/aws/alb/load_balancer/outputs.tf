output "arn" {
  description = "The ARN of the ALB"
  value       = module.aws_lb_this.this_arn
}
output "dns_name" {
  description = "The DNS name of the ALB"
  value       = module.aws_lb_this.this_dns_name
}
output "id" {
  description = "The ID of the ALB"
  value       = module.aws_lb_this.this_id
}
output "zone_id" {
  description = "The canonical hosted zone ID of the ALB"
  value       = module.aws_lb_this.this_zone_id
}
