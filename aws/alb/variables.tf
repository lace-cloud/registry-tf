variable "environment_name"{
  description="Environment name dev/test"
  type= string
}

variable "lb_name"{
  type=string
}

variable "lb_type"{
  type=string
}

variable lb_internal{
  type=bool
}


variable "vpc_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

#target group

variable "lb_tg_name"{
  type=string
}

variable "lb_tg_port"{
  type=number
}

variable "lb_tg_protocol"{
  type=string
}

variable "lb_tg_target_type"{
  type=string
}

#lb lb_listener


variable "lb_listener_protocol"{
  type=string
}

variable "lb_listener_port"{
  type=number
}

variable "lb_listener_action_type"{
  type=string
}

variable "tags"{
  type = map(string)
}


variable "optional_tags"{
  type=map(string)
  default={}
}