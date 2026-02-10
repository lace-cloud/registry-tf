variable "description" {
  description = "Description of the KMS key"
  type        = string
  default     = ""
}

variable "key_usage" {
  description = "Key usage (ENCRYPT_DECRYPT or SIGN_VERIFY)"
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "customer_master_key_spec" {
  description = "Key spec (SYMMETRIC_DEFAULT, RSA_2048, etc.)"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}

variable "deletion_window_in_days" {
  description = "Waiting period before key deletion (7-30 days)"
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Enable automatic key rotation"
  type        = bool
  default     = true
}

variable "policy" {
  description = "Key policy JSON document"
  type        = string
  default     = null
}

variable "is_enabled" {
  description = "Whether the key is enabled"
  type        = bool
  default     = true
}

variable "multi_region" {
  description = "Whether the key is a multi-region key"
  type        = bool
  default     = false
}

variable "alias" {
  description = "Alias for the key (e.g., alias/my-key)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
