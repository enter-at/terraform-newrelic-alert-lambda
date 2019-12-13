variable "enabled" {
  type        = bool
  description = "(Optional) Set whether to enable the alert condition. Defaults to true."
  default     = true
}

variable "function_arn" {
  type        = string
  description = "(Required) The Amazon Resource Name (ARN) identifying the Lambda function."
}

variable "function_name" {
  type        = string
  description = "(Required) The name identifying the Lambda function."
}

variable "function_timeout" {
  type        = number
  description = "(Required) The amount of time the Lambda function can run in seconds."
}

variable "policy_id" {
  type        = string
  description = "(Required) The ID of the policy where this condition should be used."
}

variable "runbook_url" {
  type        = string
  description = "(Optional) Runbook URL to display in notifications."
  default     = null
}

variable "error_duration_critical" {
  type        = number
  description = "(Required) In minutes, must be in the range of 1 to 120, inclusive. Defaults to 3."
  default     = 3
}

variable "error_threshold_critical" {
  type        = number
  description = "(Required) Must be 0 or greater. Defaults to 0."
  default     = 0
}

variable "since_value" {
  type        = number
  description = "(Optional) The value to be used in the SINCE <X> MINUTES AGO clause for the NRQL query. Must be between 1 and 20. Defaults to 3."
  default     = 3
}