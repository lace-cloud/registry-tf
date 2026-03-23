variable "name" {
  description = "The name of the DB subnet group"
  type        = string
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs to include in the subnet group"
  type        = list(string)
}

variable "description" {
  description = "A description for the DB subnet group"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to assign to the subnet group"
  type        = map(string)
  default     = {}
}
