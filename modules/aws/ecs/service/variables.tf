variable "assign_public_ip" {
  description = "Whether to assign a public IP to the task ENI"
  type        = bool
  default     = false
}
variable "cluster_id" {
  description = "The ID of the ECS cluster to run the service in"
  type        = string
}
variable "container_name" {
  description = "The name of the container to associate with the load balancer"
  type        = string
  default     = null
}
variable "container_port" {
  description = "The port on the container to associate with the load balancer"
  type        = number
  default     = null
}
variable "desired_count" {
  description = "The number of task instances to run"
  type        = number
  default     = 1
}
variable "launch_type" {
  description = "The launch type for the service"
  type        = string
  default     = "FARGATE"
}
variable "name" {
  description = "The name of the ECS service"
  type        = string
}
variable "security_group_ids" {
  description = "The security group IDs for the service network configuration"
  type        = list(string)
  default     = []
}
variable "subnet_ids" {
  description = "The subnet IDs for the service network configuration"
  type        = list(string)
}
variable "tags" {
  description = "A map of tags to assign to the service"
  type        = map(string)
  default     = {}
}
variable "target_group_arn" {
  description = "The ARN of the ALB target group for load balancer integration"
  type        = string
  default     = null
}
variable "task_definition" {
  description = "The ARN of the task definition to use"
  type        = string
}
