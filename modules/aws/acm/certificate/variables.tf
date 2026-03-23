variable "domain_name" {
  description = "The domain name for which the certificate should be issued"
  type        = string
}

variable "subject_alternative_names" {
  description = "Additional domain names to include in the certificate"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "The validation method to use (DNS or EMAIL)"
  type        = string
  default     = "DNS"
}

variable "tags" {
  description = "A map of tags to assign to the certificate"
  type        = map(string)
  default     = {}
}
