variable "name" {
  description = "The name of the Cognito user pool"
  type        = string
}

variable "username_attributes" {
  description = "Attributes supported as an alias for this user pool (e.g. email, phone_number)"
  type        = list(string)
  default     = ["email"]
}

variable "auto_verified_attributes" {
  description = "Attributes to be auto-verified (e.g. email, phone_number)"
  type        = list(string)
  default     = ["email"]
}

variable "password_policy" {
  description = "Password policy configuration for the user pool"
  type = object({
    minimum_length                   = optional(number, 8)
    require_lowercase                = optional(bool, true)
    require_uppercase                = optional(bool, true)
    require_numbers                  = optional(bool, true)
    require_symbols                  = optional(bool, false)
    temporary_password_validity_days = optional(number, 7)
  })
  default = {}
}

variable "recovery_mechanisms" {
  description = "List of account recovery mechanisms. Each object must have name and priority."
  type = list(object({
    name     = string
    priority = number
  }))
  default = [
    {
      name     = "verified_email"
      priority = 1
    }
  ]
}

variable "tags" {
  description = "A map of tags to assign to the user pool"
  type        = map(string)
  default     = {}
}
