variable "rsync_pattern" {
  type        = list(string)
  description = "(Optional) A list of rsync pattern to include or exclude files and directories."

  default = [
    "--include=*"
  ]
}

variable "source_dir" {
  type        = string
  description = "(Required) The location of the handler source code."
}

variable "description" {
  type        = string
  description = "(Optional) Description of what your Lambda Function does."
  default     = null
}

variable "layers" {
  type = list(string)

  description = "(Optional) List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function."
  default     = null
}

variable "memory_size" {
  type        = number
  description = "(Optional) Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  default     = 128
}

variable "timeout" {
  type        = number
  description = "(Optional) The amount of time your Lambda Function has to run in seconds. Defaults to 3."
  default     = 3
}

variable "function_name" {
  type        = string
  description = "(Required) A unique name for your Lambda Function."
}

variable "handler" {
  type        = string
  description = "(Required) The function entrypoint in your code."
}

variable "reserved_concurrent_executions" {
  type        = number
  description = "(Optional) The amount of reserved concurrent executions for this lambda function."
  default     = null
}

variable "dead_letter_config" {
  type = object({
    target_arn = string
  })

  description = "(Optional) Nested block to configure the function's dead letter queue."
  default     = null
}

variable "vpc_config" {
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })

  description = "(Optional) Provide this to allow your function to access your VPC."
  default     = null
}

variable "environment" {
  type = object({
    variables = map(string)
  })

  description = "(Optional) The Lambda environment's configuration settings."
  default     = null
}

variable "tracing_config" {
  type = object({
    mode = string
  })

  description = "(Optional) A child block with a single argument mode"
  default     = null
}

variable "policy" {
  type = object({
    json = string
  })

  description = "(Optional) An additional policy to attach to the Lambda function role."
  default     = null
}

variable "runtime" {
  type        = string
  description = "(Required) The identifier of the function's runtime."
}

variable "tags" {
  type = map(string)

  description = "(Optional) A mapping of tags to assign to the object."
  default     = null
}
