variable "domain" {
  description = "The Cognito hosted UI domain prefix (must be unique across AWS)"
  type        = string
}

variable "user_pool_id" {
  description = "The ID of the Cognito user pool to associate the domain with"
  type        = string
}
