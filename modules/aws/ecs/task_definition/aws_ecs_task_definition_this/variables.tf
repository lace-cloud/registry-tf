variable "container_definitions" {
  type = string
}
variable "cpu" {
  type = number
}
variable "execution_role_arn" {
  type = string
}
variable "family" {
  type = string
}
variable "memory" {
  type = number
}
variable "network_mode" {
  type = string
}
variable "requires_compatibilities" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}
variable "task_role_arn" {
  type = string
}
