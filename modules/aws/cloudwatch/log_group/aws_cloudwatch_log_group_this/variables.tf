variable "kms_key_id" {
  type = string
}
variable "log_group_class" {
  type = string
}
variable "name" {
  type = string
}
variable "retention_in_days" {
  type = number
}
variable "skip_destroy" {
  type = bool
}
variable "tags" {
  type = map(string)
}
