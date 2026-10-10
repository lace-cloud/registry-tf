variable "health_check____null____var_health_check______" {
  description = "boundary crossing for var.health_check != null ? [var.health_check] : []"
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
variable "tags" {
  type = map(string)
}
variable "target_type" {
  type = string
}
variable "vpc_id" {
  type = string
}
