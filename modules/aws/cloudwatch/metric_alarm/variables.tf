variable "alarm_actions" {
  description = "List of ARNs to notify when alarm transitions to ALARM"
  type        = list(string)
  default     = []
}
variable "alarm_description" {
  description = "Description of the alarm"
  type        = string
  default     = ""
}
variable "alarm_name" {
  description = "Name of the alarm"
  type        = string
}
variable "comparison_operator" {
  description = "Comparison operator (GreaterThanThreshold, LessThanThreshold, etc.)"
  type        = string
}
variable "datapoints_to_alarm" {
  description = "Number of datapoints that must breach to trigger alarm"
  type        = number
  default     = null
}
variable "dimensions" {
  description = "Dimensions for the metric"
  type        = map(string)
  default     = {}
}
variable "evaluation_periods" {
  description = "Number of periods to evaluate"
  type        = number
}
variable "insufficient_data_actions" {
  description = "List of ARNs to notify when alarm transitions to INSUFFICIENT_DATA"
  type        = list(string)
  default     = []
}
variable "metric_name" {
  description = "Name of the metric"
  type        = string
}
variable "namespace" {
  description = "CloudWatch namespace for the metric"
  type        = string
}
variable "ok_actions" {
  description = "List of ARNs to notify when alarm transitions to OK"
  type        = list(string)
  default     = []
}
variable "period" {
  description = "Period in seconds over which the statistic is applied"
  type        = number
}
variable "statistic" {
  description = "Statistic to apply (Average, Sum, Minimum, Maximum, SampleCount)"
  type        = string
}
variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
variable "threshold" {
  description = "Threshold value for the alarm"
  type        = number
}
variable "treat_missing_data" {
  description = "How to treat missing data (missing, ignore, breaching, notBreaching)"
  type        = string
  default     = "missing"
}
