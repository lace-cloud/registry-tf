variable "ecs_cluster_name" {
  type = string
}

variable "environment_name"{
  description="Environment name dev/test"
  type= string
}

variable "settings_value"{
  description="Environment name dev/test"
  type= string
}

variable "tags"{
  type = map(string)
}


variable "optional_tags"{
  type=map(string)
  default={}
}