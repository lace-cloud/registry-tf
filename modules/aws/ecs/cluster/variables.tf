variable "capacity_providers" {
  description = "List of capacity providers to associate with the cluster"
  type        = list(string)
  default     = ["FARGATE"]
}
variable "container_insights" {
  description = "Whether to enable Container Insights for the cluster"
  type        = bool
  default     = true
}
variable "default_capacity_provider_strategy" {
  description = "Default capacity provider strategy for the cluster"
  type        = list(object({
    capacity_provider = string
    weight            = optional(number)
    base              = optional(number)
  }))
  default     = []
}
variable "name" {
  description = "The name of the ECS cluster"
  type        = string
}
variable "tags" {
  description = "A map of tags to assign to the cluster"
  type        = map(string)
  default     = {}
}
