resource "newrelic_nrql_alert_condition" "error_rate_min" {
  name           = "Lambda error rate during ${var.error_duration_critical}min"
  enabled        = var.enabled
  policy_id      = var.policy_id
  runbook_url    = var.runbook_url
  value_function = "single_value"

  nrql {
    query = <<NRQL
        SELECT count(*)
        FROM AwsLambdaInvocationError
        WHERE aws.lambda.arn = '${var.function_arn}'
    NRQL

    evaluation_offset = var.evaluation_offset
  }

  critical {
    operator              = "above"
    threshold             = var.error_threshold_critical
    threshold_duration    = var.error_duration_critical
    threshold_occurrences = "any"
  }
}

resource "newrelic_nrql_alert_condition" "error_rate_percentage" {
  name           = "Lambda percentage of errors during ${var.error_duration_critical}min"
  enabled        = var.enabled
  policy_id      = var.policy_id
  runbook_url    = var.runbook_url
  value_function = "single_value"

  nrql {
    query = <<NRQL
        SELECT percentage(count(*), WHERE error is true)
        FROM AwsLambdaInvocation
        WHERE aws.lambda.arn = '${var.function_arn}'
    NRQL

    evaluation_offset = var.evaluation_offset
  }

  critical {
    operator              = "above"
    threshold             = var.error_threshold_critical
    threshold_duration    = var.error_duration_critical
    threshold_occurrences = "any"
  }
}

resource "newrelic_nrql_alert_condition" "execution_time" {
  name           = "Lambda execution timeout of ${var.function_timeout}sec almost exceeded"
  enabled        = var.enabled
  policy_id      = var.policy_id
  runbook_url    = var.runbook_url
  value_function = "single_value"

  nrql {
    query = <<NRQL
        SELECT max(duration)
        FROM AwsLambdaInvocation
        WHERE aws.lambda.arn = '${var.function_arn}'
    NRQL

    evaluation_offset = var.evaluation_offset
  }

  critical {
    operator              = "above"
    threshold             = var.function_timeout * 0.95
    threshold_duration    = var.error_duration_critical
    threshold_occurrences = "any"
  }

  warning {
    operator              = "above"
    threshold             = var.function_timeout * 0.8
    threshold_duration    = var.error_duration_critical * 2
    threshold_occurrences = "all"
  }
}
