variable "default_action_type" {
  type = string
}
variable "default_action_type_____fixed_response_____1______" {
  description = "boundary crossing for var.default_action_type == \"fixed-response\" ? [1] : []"
}
variable "default_action_type_____forward____var_default_action_target_group_arn___null" {
  description = "boundary crossing for var.default_action_type == \"forward\" ? var.default_action_target_group_arn : null"
}
variable "fixed_response_content_type" {
  type = string
}
variable "fixed_response_message_body" {
  type = string
}
variable "fixed_response_status_code" {
  type = string
}
variable "load_balancer_arn" {
  type = string
}
variable "name" {
  type = string
}
variable "port" {
  type = number
}
variable "protocol" {
  type = string
}
variable "protocol_____HTTPS____var_certificate_arn___null" {
  description = "boundary crossing for var.protocol == \"HTTPS\" ? var.certificate_arn : null"
}
variable "protocol_____HTTPS____var_ssl_policy___null" {
  description = "boundary crossing for var.protocol == \"HTTPS\" ? var.ssl_policy : null"
}
variable "tags" {
  type = map(string)
}
