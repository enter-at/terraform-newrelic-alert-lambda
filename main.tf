resource "newrelic_nrql_alert_condition" "error_rate_min" {
  name      = "Lambda error rate during ${var.error_duration_critical}min"
  enabled   = var.enabled
  policy_id = var.policy_id

  term {
    duration      = var.error_duration_critical
    operator      = "above"
    priority      = "critical"
    threshold     = var.error_threshold_critical
    time_function = "any"
  }

  nrql {
    query = <<NRQL
        SELECT count(*)
        FROM AwsLambdaInvocationError
        WHERE aws.lambda.arn = '${var.function_arn}'
    NRQL

    since_value = var.since_value
  }

  runbook_url    = var.runbook_url
  value_function = "single_value"
}

resource "newrelic_nrql_alert_condition" "execution_time" {
  name      = "Lambda execution timeout of ${var.function_timeout}sec almost exceeded"
  enabled   = var.enabled
  policy_id = var.policy_id

  term {
    duration      = var.error_duration_critical
    operator      = "above"
    priority      = "critical"
    threshold     = var.function_timeout * 0.95
    time_function = "any"
  }

  term {
    duration      = var.error_duration_critical
    operator      = "above"
    priority      = "warning"
    threshold     = var.function_timeout * 0.8
    time_function = "all"
  }

  nrql {
    query = <<NRQL
        SELECT max(duration)
        FROM AwsLambdaInvocation
        WHERE aws.lambda.arn = '${var.function_arn}'
    NRQL

    since_value = var.since_value
  }

  runbook_url    = var.runbook_url
  value_function = "single_value"
}
