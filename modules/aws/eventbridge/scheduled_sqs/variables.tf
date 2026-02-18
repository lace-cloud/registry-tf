variable "name" {
  description = "Base name used for all resources (rule, queue, log group)"
  type        = string
}

variable "schedule_expression" {
  description = "EventBridge schedule expression (e.g., rate(5 minutes), cron(0 12 * * ? *)). Mutually exclusive with event_pattern."
  type        = string
  default     = null
}

variable "event_pattern" {
  description = "EventBridge event pattern JSON string. Mutually exclusive with schedule_expression."
  type        = string
  default     = null
}

variable "rule_description" {
  description = "Human-readable description for the EventBridge rule"
  type        = string
  default     = ""
}

variable "visibility_timeout" {
  description = "SQS visibility timeout in seconds"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "SQS message retention period in seconds (default 4 days)"
  type        = number
  default     = 345600
}

variable "log_retention_days" {
  description = "CloudWatch log group retention in days (0 = never expire)"
  type        = number
  default     = 14
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
