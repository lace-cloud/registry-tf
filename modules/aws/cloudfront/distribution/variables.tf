variable "origin_domain_name" {
  description = "Domain name of the origin"
  type        = string
}

variable "origin_id" {
  description = "Unique identifier for the origin"
  type        = string
}

variable "enabled" {
  description = "Whether the distribution is enabled"
  type        = bool
  default     = true
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled"
  type        = bool
  default     = true
}

variable "default_root_object" {
  description = "Default root object (e.g., index.html)"
  type        = string
  default     = null
}

variable "price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_100"
}

variable "aliases" {
  description = "List of CNAMEs (alternate domain names)"
  type        = list(string)
  default     = []
}

variable "comment" {
  description = "Comment for the distribution"
  type        = string
  default     = ""
}

variable "web_acl_id" {
  description = "WAF Web ACL ID"
  type        = string
  default     = null
}

variable "origin_access_identity" {
  description = "CloudFront origin access identity path (for S3 origins)"
  type        = string
  default     = null
}

variable "custom_origin_http_port" {
  description = "HTTP port for custom origin"
  type        = number
  default     = 80
}

variable "custom_origin_https_port" {
  description = "HTTPS port for custom origin"
  type        = number
  default     = 443
}

variable "origin_protocol_policy" {
  description = "Origin protocol policy (http-only, https-only, match-viewer)"
  type        = string
  default     = "https-only"
}

variable "origin_ssl_protocols" {
  description = "SSL protocols for custom origin"
  type        = list(string)
  default     = ["TLSv1.2"]
}

variable "viewer_protocol_policy" {
  description = "Viewer protocol policy (allow-all, https-only, redirect-to-https)"
  type        = string
  default     = "redirect-to-https"
}

variable "allowed_methods" {
  description = "Allowed HTTP methods"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cached_methods" {
  description = "Cached HTTP methods"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "compress" {
  description = "Enable compression"
  type        = bool
  default     = true
}

variable "min_ttl" {
  description = "Minimum TTL in seconds"
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "Default TTL in seconds"
  type        = number
  default     = 86400
}

variable "max_ttl" {
  description = "Maximum TTL in seconds"
  type        = number
  default     = 31536000
}

variable "forward_query_string" {
  description = "Whether to forward query strings"
  type        = bool
  default     = false
}

variable "forward_cookies" {
  description = "Cookie forwarding option (none, whitelist, all)"
  type        = string
  default     = "none"
}

variable "geo_restriction_type" {
  description = "Geo restriction type (none, whitelist, blacklist)"
  type        = string
  default     = "none"
}

variable "geo_restriction_locations" {
  description = "List of country codes for geo restriction"
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type        = string
  default     = null
}

variable "minimum_protocol_version" {
  description = "Minimum SSL/TLS protocol version"
  type        = string
  default     = "TLSv1.2_2021"
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
