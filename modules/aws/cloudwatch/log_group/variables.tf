variable "name" {
  description = "Name of the CloudWatch log group"
  type        = string
}

variable "retention_in_days" {
  description = "Number of days to retain log events (0 = never expire)"
  type        = number
  default     = 14
}

variable "kms_key_id" {
  description = "KMS key ARN for log group encryption"
  type        = string
  default     = null
}

variable "log_group_class" {
  description = "Log group class (STANDARD or INFREQUENT_ACCESS)"
  type        = string
  default     = "STANDARD"
}

variable "skip_destroy" {
  description = "Whether to skip destruction of the log group on delete"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
