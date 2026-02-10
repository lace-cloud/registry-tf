variable "zone_id" {
  description = "Route53 hosted zone ID"
  type        = string
}

variable "name" {
  description = "DNS record name"
  type        = string
}

variable "type" {
  description = "DNS record type (A, AAAA, CNAME, MX, TXT, etc.)"
  type        = string
}

variable "ttl" {
  description = "TTL in seconds (not used for alias records)"
  type        = number
  default     = 300
}

variable "records" {
  description = "List of record values (not used for alias records)"
  type        = list(string)
  default     = null
}

variable "alias" {
  description = "Alias target configuration"
  type = object({
    name                   = string
    zone_id                = string
    evaluate_target_health = optional(bool, false)
  })
  default = null
}

variable "set_identifier" {
  description = "Unique identifier for weighted/latency/failover routing"
  type        = string
  default     = null
}

variable "health_check_id" {
  description = "Health check ID to associate"
  type        = string
  default     = null
}
