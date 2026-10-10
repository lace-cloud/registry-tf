variable "auto_verified_attributes" {
  type = list(string)
}
variable "name" {
  type = string
}
variable "password_policy____null____var_password_policy______" {
  description = "boundary crossing for var.password_policy != null ? [var.password_policy] : []"
}
variable "recovery_mechanisms" {
  type = list(object({
    name     = string
    priority = number
  }))
}
variable "recovery_mechanisms____null____1______" {
  description = "boundary crossing for var.recovery_mechanisms != null ? [1] : []"
}
variable "tags" {
  type = map(string)
}
variable "username_attributes" {
  type = list(string)
}
