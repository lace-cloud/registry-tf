variable "name" {
  description = "The name of the Cognito user pool client"
  type        = string
}

variable "user_pool_id" {
  description = "The ID of the Cognito user pool"
  type        = string
}

variable "generate_secret" {
  description = "Whether to generate a client secret (required for ALB OIDC integration)"
  type        = bool
  default     = false
}

variable "allowed_oauth_flows" {
  description = "List of allowed OAuth flows (e.g. code, implicit, client_credentials)"
  type        = list(string)
  default     = ["code"]
}

variable "allowed_oauth_scopes" {
  description = "List of allowed OAuth scopes (e.g. openid, email, profile)"
  type        = list(string)
  default     = ["openid", "email", "profile"]
}

variable "allowed_oauth_flows_user_pool_client" {
  description = "Whether the client is allowed to use OAuth flows"
  type        = bool
  default     = true
}

variable "supported_identity_providers" {
  description = "List of identity providers supported by this client"
  type        = list(string)
  default     = ["COGNITO"]
}

variable "callback_urls" {
  description = "List of allowed callback URLs after authentication"
  type        = list(string)
  default     = []
}

variable "logout_urls" {
  description = "List of allowed logout URLs"
  type        = list(string)
  default     = []
}

variable "access_token_validity" {
  description = "Time limit for access tokens"
  type        = number
  default     = 1
}

variable "id_token_validity" {
  description = "Time limit for ID tokens"
  type        = number
  default     = 1
}

variable "refresh_token_validity" {
  description = "Time limit for refresh tokens"
  type        = number
  default     = 30
}

variable "token_validity_units" {
  description = "Token validity unit configuration. Keys: access_token, id_token, refresh_token. Valid values: seconds, minutes, hours, days"
  type        = map(string)
  default = {
    access_token  = "hours"
    id_token      = "hours"
    refresh_token = "days"
  }
}
