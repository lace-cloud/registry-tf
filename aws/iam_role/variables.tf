variable "name" {
  description = "Resource name"
  type        = string
}

variable "policy" {
  description = "IAM Policy Document"
  type        = map(any)
}

