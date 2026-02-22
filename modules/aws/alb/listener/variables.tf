variable "name" {
  description = "A name tag for the listener"
  type        = string
  default     = ""
}

variable "load_balancer_arn" {
  description = "The ARN of the ALB to attach the listener to"
  type        = string
}

variable "port" {
  description = "The port on which the listener receives traffic"
  type        = number
}

variable "protocol" {
  description = "The protocol for the listener (HTTP or HTTPS)"
  type        = string
  default     = "HTTP"
}

variable "ssl_policy" {
  description = "The SSL policy for an HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "certificate_arn" {
  description = "The ARN of the SSL certificate for an HTTPS listener"
  type        = string
  default     = null
}

variable "default_action_type" {
  description = "The type of default action (forward, fixed-response, redirect)"
  type        = string
  default     = "forward"
}

variable "default_action_target_group_arn" {
  description = "The ARN of the target group for a forward action"
  type        = string
  default     = null
}

variable "fixed_response_content_type" {
  description = "The content type for a fixed-response action"
  type        = string
  default     = "text/plain"
}

variable "fixed_response_message_body" {
  description = "The message body for a fixed-response action"
  type        = string
  default     = null
}

variable "fixed_response_status_code" {
  description = "The HTTP status code for a fixed-response action"
  type        = string
  default     = "200"
}

variable "tags" {
  description = "A map of tags to assign to the listener"
  type        = map(string)
  default     = {}
}
