variable "access_logs_bucket" {
  type = string
}
variable "access_logs_bucket____null____1______" {
  description = "boundary crossing for var.access_logs_bucket != null ? [1] : []"
}
variable "access_logs_prefix" {
  type = string
}
variable "enable_deletion_protection" {
  type = bool
}
variable "internal" {
  type = bool
}
variable "name" {
  type = string
}
variable "security_group_ids" {
  type = list(string)
}
variable "subnet_ids" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}
