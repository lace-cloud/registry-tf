variable "name" {
  description = "The name of the Application Load Balancer"
  type        = string
}

variable "internal" {
  description = "Whether the ALB is internal (true) or internet-facing (false)"
  type        = bool
  default     = false
}

variable "security_group_ids" {
  description = "The security group IDs to assign to the ALB"
  type        = list(string)
}

variable "subnet_ids" {
  description = "The subnet IDs to attach the ALB to"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection on the ALB"
  type        = bool
  default     = false
}

variable "access_logs_bucket" {
  description = "The S3 bucket name for ALB access logs"
  type        = string
  default     = null
}

variable "access_logs_prefix" {
  description = "The S3 key prefix for ALB access logs"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the ALB"
  type        = map(string)
  default     = {}
}
