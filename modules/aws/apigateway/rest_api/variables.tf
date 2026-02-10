variable "name" {
  description = "Name of the REST API"
  type        = string
}

variable "description" {
  description = "Description of the REST API"
  type        = string
  default     = ""
}

variable "body" {
  description = "OpenAPI specification body (JSON or YAML string)"
  type        = string
  default     = null
}

variable "endpoint_type" {
  description = "Endpoint type (EDGE, REGIONAL, PRIVATE)"
  type        = string
  default     = "REGIONAL"
}

variable "stage_name" {
  description = "Name of the deployment stage"
  type        = string
  default     = "prod"
}

variable "stage_description" {
  description = "Description of the stage"
  type        = string
  default     = ""
}

variable "stage_variables" {
  description = "Stage variables"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
