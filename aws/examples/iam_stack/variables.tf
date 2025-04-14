variable "role_name" {
  description = "IAM role name to create"
  type        = string
}

variable "assume_role_policy" {
  description = "Trust policy for the IAM role"
  type        = string
}

variable "tags" {
  description = "Tags for the IAM role"
  type        = map(string)
}
