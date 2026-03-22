variable "name" {
  description = "The name of the target group"
  type        = string
}

variable "port" {
  description = "The port on which targets receive traffic"
  type        = number
}

variable "protocol" {
  description = "The protocol to use for routing traffic to the targets"
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "The VPC ID in which to create the target group"
  type        = string
}

variable "target_type" {
  description = "The type of target (instance, ip, lambda, alb)"
  type        = string
  default     = "ip"
}

variable "health_check" {
  description = "Health check configuration for the target group"
  type        = map(any)
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the target group"
  type        = map(string)
  default     = {}
}
