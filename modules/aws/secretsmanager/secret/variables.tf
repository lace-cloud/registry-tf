variable "name" {
  description = "The name of the secret"
  type        = string
}

variable "description" {
  description = "A description of the secret"
  type        = string
  default     = ""
}

variable "kms_key_id" {
  description = "The KMS key ID to use for encryption. If null, uses the default Secrets Manager key"
  type        = string
  default     = null
}

variable "recovery_window_in_days" {
  description = "Number of days that Secrets Manager waits before deleting the secret. Set to 0 to delete immediately"
  type        = number
  default     = 30
}

variable "secret_string" {
  description = "The initial secret value as a string. If null, no version is created (value must be set manually)"
  type        = string
  default     = null
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to assign to the secret"
  type        = map(string)
  default     = {}
}
