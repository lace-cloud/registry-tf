variable "vpc_id" {
  description = "ID of the VPC to attach the internet gateway to"
  type        = string
}

variable "name" {
  description = "Name of the internet gateway"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
