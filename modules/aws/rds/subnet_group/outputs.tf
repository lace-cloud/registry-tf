output "arn" {
  description = "The ARN of the DB subnet group"
  value       = module.aws_db_subnet_group_this.this_arn
}
output "id" {
  description = "The ID of the DB subnet group"
  value       = module.aws_db_subnet_group_this.this_id
}
output "name" {
  description = "The name of the DB subnet group"
  value       = module.aws_db_subnet_group_this.this_name
}
