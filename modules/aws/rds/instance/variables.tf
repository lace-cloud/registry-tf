variable "name" {
  description = "The identifier for the RDS instance and subnet group"
  type        = string
}

variable "engine" {
  description = "The database engine (e.g. postgres, mysql)"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "15"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.small"
}

variable "allocated_storage" {
  description = "The initial allocated storage in GiB"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "The upper limit for storage autoscaling in GiB. Set to 0 to disable autoscaling"
  type        = number
  default     = 100
}

variable "storage_type" {
  description = "The storage type (gp2, gp3, io1)"
  type        = string
  default     = "gp3"
}

variable "storage_encrypted" {
  description = "Whether the DB storage is encrypted"
  type        = bool
  default     = true
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "username" {
  description = "The master username for the database"
  type        = string
}

variable "password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group to associate with the instance"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security group IDs to associate with the instance"
  type        = list(string)
  default     = []
}

variable "backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "The daily time range during which automated backups are created (UTC)"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "The window for maintenance operations"
  type        = string
  default     = "Mon:04:00-Mon:05:00"
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot on deletion"
  type        = bool
  default     = false
}

variable "performance_insights_enabled" {
  description = "Whether to enable Performance Insights"
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "Whether to enable Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to all resources"
  type        = map(string)
  default     = {}
}
