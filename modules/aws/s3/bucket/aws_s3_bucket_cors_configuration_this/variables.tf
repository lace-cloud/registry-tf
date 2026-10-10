variable "cors_rules" {
  type = list(object({
    allowed_headers = optional(list(string), ["*"])
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = optional(list(string), [])
    max_age_seconds = optional(number, 3600)
  }))
}
variable "this_id" {
  description = "boundary crossing for aws_s3_bucket.this.id"
}
