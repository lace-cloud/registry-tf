variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime (e.g., nodejs20.x, python3.12, go1.x)"
  type        = string
}

variable "handler" {
  description = "Function entrypoint (e.g., index.handler)"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for Lambda execution"
  type        = string
}

variable "filename" {
  description = "Path to the deployment package ZIP file"
  type        = string
  default     = null
}

variable "s3_bucket" {
  description = "S3 bucket containing the deployment package"
  type        = string
  default     = null
}

variable "s3_key" {
  description = "S3 key of the deployment package"
  type        = string
  default     = null
}

variable "memory_size" {
  description = "Amount of memory in MB for the function"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Function timeout in seconds"
  type        = number
  default     = 3
}

variable "architectures" {
  description = "Instruction set architecture (e.g., x86_64, arm64)"
  type        = list(string)
  default     = ["x86_64"]
}

variable "layers" {
  description = "List of Lambda layer ARNs to attach"
  type        = list(string)
  default     = []
}

variable "publish" {
  description = "Whether to publish creation/change as new Lambda function version"
  type        = bool
  default     = false
}

variable "environment_variables" {
  description = "Environment variables for the function"
  type        = map(string)
  default     = {}
}

variable "subnet_ids" {
  description = "List of subnet IDs for VPC configuration"
  type        = list(string)
  default     = null
}

variable "security_group_ids" {
  description = "List of security group IDs for VPC configuration"
  type        = list(string)
  default     = []
}

variable "log_retention_in_days" {
  description = "CloudWatch log group retention in days"
  type        = number
  default     = 14
}

variable "tags" {
  description = "Additional tags for the function"
  type        = map(string)
  default     = {}
}
