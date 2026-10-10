variable "action_type_____fixed_response_____1______" {
  description = "boundary crossing for var.action_type == \"fixed-response\" ? [1] : []"
}
variable "action_type_____forward_____1______" {
  description = "boundary crossing for var.action_type == \"forward\" ? [1] : []"
}
variable "action_type_____redirect_____1______" {
  description = "boundary crossing for var.action_type == \"redirect\" ? [1] : []"
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
variable "host_headers" {
  type = list(string)
}
variable "listener_arn" {
  type = string
}
variable "name" {
  type = string
}
variable "path_patterns" {
  type = list(string)
}
variable "priority" {
  type = number
}
variable "redirect_port" {
  type = string
}
variable "redirect_protocol" {
  type = string
}
variable "redirect_status_code" {
  type = string
}
variable "tags" {
  type = map(string)
}
variable "target_group_arn" {
  type = string
}
