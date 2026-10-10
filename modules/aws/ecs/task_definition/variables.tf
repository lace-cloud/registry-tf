variable "container_definitions" {
  description = "A JSON-encoded string of container definitions"
  type        = string
}
variable "cpu" {
  description = "The number of CPU units for the task (e.g. 256, 512, 1024)"
  type        = number
}
variable "execution_role_arn" {
  description = "The ARN of the IAM role for ECS task execution (pulling images, logging)"
  type        = string
}
variable "family" {
  description = "A unique name for the task definition family"
  type        = string
}
variable "memory" {
  description = "The amount of memory in MiB for the task (e.g. 512, 1024, 2048)"
  type        = number
}
variable "network_mode" {
  description = "The network mode to use for the task"
  type        = string
  default     = "awsvpc"
}
variable "requires_compatibilities" {
  description = "A set of launch types required by the task"
  type        = list(string)
  default     = ["FARGATE"]
}
variable "tags" {
  description = "A map of tags to assign to the task definition"
  type        = map(string)
  default     = {}
}
variable "task_role_arn" {
  description = "The ARN of the IAM role for the task containers to call AWS APIs"
  type        = string
  default     = null
}
