output "db_instance_id" {
  description = "ID of the RDS instance"
  value       = module.db.db_instance_id
}

output "db_instance_arn" {
  description = "ARN of the RDS instance"
  value       = module.db.db_instance_arn
}

output "db_endpoint" {
  description = "Connection endpoint of the RDS instance (host:port)"
  value       = module.db.db_endpoint
}

output "db_address" {
  description = "Hostname of the RDS instance"
  value       = module.db.db_address
}

output "db_port" {
  description = "Port the database is listening on"
  value       = module.db.db_port
}

output "db_name" {
  description = "Name of the default database"
  value       = module.db.db_name
}

output "subnet_group_name" {
  description = "Name of the DB subnet group"
  value       = module.subnet_group.subnet_group_name
}

output "cpu_alarm_arn" {
  description = "ARN of the CPU utilization CloudWatch alarm"
  value       = module.cpu_alarm.alarm_arn
}

output "storage_alarm_arn" {
  description = "ARN of the free storage space CloudWatch alarm"
  value       = module.storage_alarm.alarm_arn
}
