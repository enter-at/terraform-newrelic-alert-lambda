data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}

locals {
  partition             = data.aws_partition.current.partition
  account_id            = data.aws_caller_identity.current.account_id
  lambda_log_group_name = "/aws/lambda/${var.function_name}"
  lambda_log_group_arn  = "arn:${local.partition}:logs:*:${local.account_id}:log-group:${local.lambda_log_group_name}"
}

resource "aws_cloudwatch_log_group" "main" {
  name = local.lambda_log_group_name
  tags = var.tags
}

resource "aws_lambda_function" "main" {
  function_name                  = var.function_name
  description                    = var.description
  role                           = aws_iam_role.main.arn
  handler                        = var.handler
  memory_size                    = var.memory_size
  reserved_concurrent_executions = var.reserved_concurrent_executions
  runtime                        = var.runtime
  layers                         = var.layers
  timeout                        = var.timeout
  tags                           = var.tags

  filename         = data.archive_file.function.output_path
  source_code_hash = data.archive_file.function.output_base64sha256

  # Add dynamic blocks based on variables.

  dynamic "dead_letter_config" {
    for_each = var.dead_letter_config == null ? [] : [
      var.dead_letter_config
    ]
    content {
      target_arn = dead_letter_config.value.target_arn
    }
  }

  dynamic "environment" {
    for_each = var.environment == null ? [] : [
      var.environment
    ]
    content {
      variables = environment.value.variables
    }
  }

  dynamic "tracing_config" {
    for_each = var.tracing_config == null ? [] : [
      var.tracing_config
    ]
    content {
      mode = tracing_config.value.mode
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config == null ? [] : [
      var.vpc_config
    ]
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }
}
