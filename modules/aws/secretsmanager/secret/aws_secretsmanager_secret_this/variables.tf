variable "description" {
  type = string
}
variable "kms_key_id" {
  type = string
}
variable "name" {
  type = string
}
variable "recovery_window_in_days" {
  type = number
}
variable "tags" {
  type = map(string)
}
