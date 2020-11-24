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

variable "evaluation_offset" {
  type        = number
  description = "(Optional*) Represented in minutes and must be within 1-20 minutes (inclusive). NRQL queries are evaluated in one-minute time windows. Defaults to 3."
  default     = 3
}
