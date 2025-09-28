variable "environment_name"{
  description="Environment name dev/test"
  type= string
}

variable "task_def_name" {
  description = "Name of the task definition family"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ARN of the IAM role that allows the ECS tasks to make calls to AWS services"
  type        = string
  default     = null
}

variable "ecs_execution_role_arn" {
  description = "ARN of the IAM role that grants the ECS agent permission to pull images and publish logs"
  type        = string
  default     = null
}



variable "ecs_task_cpu" {
  description = "The number of cpu units used by the task"
  type        = number
 
}

variable "ecs_task_memory" {
  description = "The amount of memory (in MiB) used by the task"
  type        = number
  
}

variable "container_name"{
  description = "The amount of memory (in MiB) used by the task"
  type        = string

}

variable "image_uri"{
  description = "The amount of memory (in MiB) used by the task"
  type        = string

}

variable "container_port_mappings"{
  type=list(object({
    containerPort=number
    hostPort=number
    protocol=string
  }))
}

variable "tags"{
  type = map(string)
}


variable "optional_tags"{
  type=map(string)
  default={}
}
