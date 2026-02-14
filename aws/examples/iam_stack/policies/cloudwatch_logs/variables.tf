variable "role_name" {
  description = "IAM role name to attach the policy to"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "actions" {
  description = "IAM actions for this policy"
  type        = list(string)
}

variable "resources" {
  description = "IAM resource ARNs"
  type        = list(string)
}
