variable "lifecycle_rules" {
  type = list(object({
    description     = optional(string)
    tag_status      = string
    tag_prefix_list = optional(list(string))
    count_type      = string
    count_number    = number
    count_unit      = optional(string)
  }))
}
variable "this_name" {
  description = "boundary crossing for aws_ecr_repository.this.name"
}
