variable "zone_id" {
  description = "The ID of the hosted zone to contain this record"
  type        = string
}

variable "name" {
  description = "The name of the DNS record"
  type        = string
}

variable "type" {
  description = "The record type (A, AAAA, CNAME, MX, TXT, etc.)"
  type        = string
}

variable "ttl" {
  description = "The TTL of the record in seconds. Not used for alias records"
  type        = number
  nullable    = true
  default     = 60
}

variable "records" {
  description = "A list of record values. Not used for alias records"
  type        = list(string)
  nullable    = true
  default     = null
}

variable "allow_overwrite" {
  description = "Whether to allow overwriting an existing record"
  type        = bool
  default     = false
}

variable "alias" {
  description = "Alias block for routing to AWS resources. Set to null for non-alias records"
  type = object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  })
  default = null
}
