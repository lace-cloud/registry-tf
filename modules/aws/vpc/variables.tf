variable "name" {
  description = "Name prefix applied to all resources"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "public_subnet_count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets to create"
  type        = number
  default     = 2
}

variable "subnet_newbits" {
  description = "Number of bits to extend the VPC CIDR for each subnet"
  type        = number
  default     = 8
}

variable "private_subnet_offset" {
  description = "Index offset for private subnet CIDR calculation to avoid overlap with public subnets"
  type        = number
  default     = 10
}

variable "enable_nat_gateway" {
  description = "Whether to create a NAT gateway and private route table"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to all resources"
  type        = map(string)
  default     = {}
}
