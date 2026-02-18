variable "bucket_name" {
  description = "Globally unique name for the S3 content bucket"
  type        = string
}

variable "default_root_object" {
  description = "Default root object served by CloudFront (e.g., index.html)"
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "CloudFront price class (PriceClass_All, PriceClass_200, PriceClass_100)"
  type        = string
  default     = "PriceClass_100"
}

variable "aliases" {
  description = "Custom domain names (CNAMEs) for the CloudFront distribution"
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for HTTPS on custom domains (must be in us-east-1)"
  type        = string
  default     = null
}

variable "enable_versioning" {
  description = "Enable versioning on the S3 content bucket"
  type        = bool
  default     = false
}

variable "comment" {
  description = "Comment for the CloudFront distribution"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
