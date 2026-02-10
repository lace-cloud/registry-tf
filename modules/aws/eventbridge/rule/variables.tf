variable "name" {
  description = "Name of the EventBridge rule"
  type        = string
}

variable "description" {
  description = "Description of the rule"
  type        = string
  default     = ""
}

variable "schedule_expression" {
  description = "Schedule expression (e.g., rate(1 hour), cron(0 12 * * ? *))"
  type        = string
  default     = null
}

variable "event_pattern" {
  description = "Event pattern JSON string"
  type        = string
  default     = null
}

variable "state" {
  description = "State of the rule (ENABLED or DISABLED)"
  type        = string
  default     = "ENABLED"
}

variable "event_bus_name" {
  description = "Event bus name (default for the default bus)"
  type        = string
  default     = "default"
}

variable "targets" {
  description = "List of targets for the rule"
  type = list(object({
    arn        = string
    target_id  = optional(string)
    input      = optional(string)
    input_path = optional(string)
    role_arn   = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
