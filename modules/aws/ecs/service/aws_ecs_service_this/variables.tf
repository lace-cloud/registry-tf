variable "assign_public_ip" {
  type = bool
}
variable "cluster_id" {
  type = string
}
variable "container_name" {
  type = string
}
variable "container_port" {
  type = number
}
variable "desired_count" {
  type = number
}
variable "launch_type" {
  type = string
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
variable "target_group_arn" {
  type = string
}
variable "target_group_arn____null____1______" {
  description = "boundary crossing for var.target_group_arn != null ? [1] : []"
}
variable "task_definition" {
  type = string
}
