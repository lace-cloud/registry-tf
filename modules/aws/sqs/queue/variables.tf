variable "name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "fifo_queue" {
  description = "Whether this is a FIFO queue"
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication for FIFO queues"
  type        = bool
  default     = false
}

variable "visibility_timeout" {
  description = "Visibility timeout in seconds"
  type        = number
  default     = 30
}

variable "message_retention" {
  description = "Message retention period in seconds"
  type        = number
  default     = 345600
}

variable "max_message_size" {
  description = "Maximum message size in bytes"
  type        = number
  default     = 262144
}

variable "delay_seconds" {
  description = "Delivery delay in seconds"
  type        = number
  default     = 0
}

variable "receive_wait_time" {
  description = "Long polling receive wait time in seconds"
  type        = number
  default     = 0
}

variable "kms_key_id" {
  description = "KMS key ID for server-side encryption"
  type        = string
  default     = null
}

variable "dead_letter_queue_arn" {
  description = "ARN of the dead-letter queue for redrive policy"
  type        = string
  default     = null
}

variable "max_receive_count" {
  description = "Max receives before sending to DLQ"
  type        = number
  default     = 5
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
