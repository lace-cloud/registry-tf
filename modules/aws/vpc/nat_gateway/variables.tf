variable "subnet_id" {
  description = "Subnet ID where the NAT gateway will be placed"
  type        = string
}

variable "allocation_id" {
  description = "Allocation ID of an existing Elastic IP (auto-created if null)"
  type        = string
  default     = null
}

variable "connectivity_type" {
  description = "Connectivity type (public or private)"
  type        = string
  default     = "public"
}

variable "name" {
  description = "Name of the NAT gateway"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
