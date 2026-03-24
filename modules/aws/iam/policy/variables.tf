variable "name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "description" {
  description = "A description of the IAM policy"
  type        = string
  default     = ""
}

variable "policy" {
  description = "The JSON policy document"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the policy"
  type        = map(string)
  default     = {}
}
