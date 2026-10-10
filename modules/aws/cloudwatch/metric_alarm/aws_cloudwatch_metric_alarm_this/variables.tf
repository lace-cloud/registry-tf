variable "alarm_actions" {
  type = list(string)
}
variable "alarm_description" {
  type = string
}
variable "alarm_name" {
  type = string
}
variable "comparison_operator" {
  type = string
}
variable "datapoints_to_alarm" {
  type = number
}
variable "dimensions" {
  type = map(string)
}
variable "evaluation_periods" {
  type = number
}
variable "insufficient_data_actions" {
  type = list(string)
}
variable "metric_name" {
  type = string
}
variable "namespace" {
  type = string
}
variable "ok_actions" {
  type = list(string)
}
variable "period" {
  type = number
}
variable "statistic" {
  type = string
}
variable "tags" {
  type = map(string)
}
variable "threshold" {
  type = number
}
variable "treat_missing_data" {
  type = string
}
