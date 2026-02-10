variable "name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "description" {
  description = "Description of the DB subnet group"
  type        = string
  default     = "Managed by Terraform"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
