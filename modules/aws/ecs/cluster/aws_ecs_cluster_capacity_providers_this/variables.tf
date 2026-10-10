variable "capacity_providers" {
  type = list(string)
}
variable "default_capacity_provider_strategy" {
  type = list(object({
    capacity_provider = string
    weight            = optional(number)
    base              = optional(number)
  }))
}
variable "this_name" {
  description = "boundary crossing for aws_ecs_cluster.this.name"
}
