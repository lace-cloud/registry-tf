variable "lifecycle_rules" {
  type = list(object({
    id                                 = string
    enabled                            = optional(bool, true)
    prefix                             = optional(string)
    expiration_days                    = optional(number)
    noncurrent_version_expiration_days = optional(number)
  }))
}
variable "lifecycle_rules____null___1___0" {
  description = "boundary crossing for var.lifecycle_rules != null ? 1 : 0"
}
variable "this_id" {
  description = "boundary crossing for aws_s3_bucket.this.id"
}
