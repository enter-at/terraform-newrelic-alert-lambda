output "error_rate_min_alert_condition_id" {
  description = "The ID of the NRQL error rate alert condition."
  value       = newrelic_nrql_alert_condition.error_rate_min.id
}

output "execution_time_alert_condition_id" {
  description = "The ID of the NRQL execution time alert condition."
  value       = newrelic_nrql_alert_condition.execution_time.id
}
