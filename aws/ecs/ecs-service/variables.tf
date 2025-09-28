variable "environment_name"{
  description="Environment name dev/test"
  type= string
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "ecs_cluster_arn" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ecs_task_def" {
  description = "ARN of the task definition to use for the service"
  type        = string
}

variable "desired_count" {
  description = "The number of instances of the task definition to run"
  type        = number
  default     = 1
}



variable "lb_tg_arn" {
  description = "ARN of the target group for the load balancer"
  type        = string
}

variable "container_name_lb" {
  description = "Name of the container to associate with the load balancer"
  type        = string
}

variable "container_port_lb" {
  description = "Port number on the container to associate with the load balancer"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS service"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the service"
  type        = list(string)
}



variable "tags"{
  type = map(string)
}


variable "optional_tags"{
  type=map(string)
  default={}
}
