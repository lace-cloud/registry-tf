variable "access_token_validity" {
  type = number
}
variable "allowed_oauth_flows" {
  type = list(string)
}
variable "allowed_oauth_flows_user_pool_client" {
  type = bool
}
variable "allowed_oauth_scopes" {
  type = list(string)
}
variable "callback_urls" {
  type = list(string)
}
variable "generate_secret" {
  type = bool
}
variable "id_token_validity" {
  type = number
}
variable "logout_urls" {
  type = list(string)
}
variable "name" {
  type = string
}
variable "refresh_token_validity" {
  type = number
}
variable "supported_identity_providers" {
  type = list(string)
}
variable "token_validity_units____null____var_token_validity_units______" {
  description = "boundary crossing for var.token_validity_units != null ? [var.token_validity_units] : []"
}
variable "user_pool_id" {
  type = string
}
