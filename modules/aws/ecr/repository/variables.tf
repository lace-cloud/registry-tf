variable "name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "Image tag mutability (MUTABLE or IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Enable image scanning on push"
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "Encryption type (AES256 or KMS)"
  type        = string
  default     = null
}

variable "kms_key" {
  description = "KMS key ARN for KMS encryption"
  type        = string
  default     = null
}

variable "force_delete" {
  description = "Delete repository even if it contains images"
  type        = bool
  default     = false
}

variable "lifecycle_rules" {
  description = "List of lifecycle policy rules"
  type = list(object({
    description     = optional(string)
    tag_status      = string
    tag_prefix_list = optional(list(string))
    count_type      = string
    count_number    = number
    count_unit      = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
