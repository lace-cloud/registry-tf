variable "name_test" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The assume role policy document (JSON string)"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the role"
  type        = map(string)
  default     = {}
}
