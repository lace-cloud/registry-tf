variable "topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "display_name" {
  description = "Display name for the SNS topic"
  type        = string
  default     = ""
}

variable "fifo_topic" {
  description = "Whether the topic is FIFO (first-in-first-out)"
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication for FIFO topics"
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "ID of AWS KMS key for server-side encryption"
  type        = string
  default     = null
}

variable "delivery_policy" {
  description = "SNS delivery policy JSON"
  type        = string
  default     = null
}

variable "topic_policy" {
  description = "SNS topic policy JSON"
  type        = string
  default     = null
}

variable "subscriptions" {
  description = "List of subscriptions to create"
  type = list(object({
    protocol              = string
    endpoint              = string
    filter_policy         = optional(string)
    filter_policy_scope   = optional(string)
    raw_message_delivery  = optional(bool)
    redrive_policy        = optional(string)
    subscription_role_arn = optional(string)
  }))
  default = []
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, production)"
  type        = string
  default     = "production"
}

variable "tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}
