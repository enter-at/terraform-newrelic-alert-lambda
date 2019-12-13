## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enabled | (Optional) Set whether to enable the alert condition. Defaults to true. | bool | `true` | no |
| error_duration_critical | (Required) In minutes, must be in the range of 1 to 120, inclusive. Defaults to 3. | number | `3` | no |
| error_threshold_critical | (Required) Must be 0 or greater. Defaults to 0. | number | `0` | no |
| function_arn | (Required) The Amazon Resource Name (ARN) identifying the Lambda function. | string | - | yes |
| function_name | (Required) The name identifying the Lambda function. | string | - | yes |
| function_timeout | (Required) The amount of time the Lambda function can run in seconds. | number | - | yes |
| policy_id | (Required) The ID of the policy where this condition should be used. | string | - | yes |
| runbook_url | (Optional) Runbook URL to display in notifications. | string | `null` | no |
| since_value | (Optional) The value to be used in the SINCE <X> MINUTES AGO clause for the NRQL query. Must be between 1 and 20. Defaults to 3. | number | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| error_rate_min_alert_condition_id | The ID of the NRQL error rate alert condition. |
| execution_time_alert_condition_id | The ID of the NRQL execution time alert condition. |

