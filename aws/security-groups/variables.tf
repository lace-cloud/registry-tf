variable "environment_name"{
  description="Environment name dev/test"
  type= string
}

variable "sg_name"{
  description = "Name of the security group"
  type = string
}

variable "sg_description"{
  description = "Description of the security group"
  type = string
}



variable "ingress_rules" {
  description = "List of security group rules"
  type = list(object({
   
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "vpc_id" {
  type = string
}

variable "egress_rules" {
  description = "List of security group rules"
  type = list(object({
    
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "tags"{
  type = map(string)
}


variable "optional_tags"{
  type=map(string)
  default={}
}
