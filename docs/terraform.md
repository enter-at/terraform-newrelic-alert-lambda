<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| newrelic | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | (Optional) Set whether to enable the alert condition. Defaults to true. | `bool` | `true` | no |
| error\_duration\_critical | (Required) In minutes, must be in the range of 1 to 120, inclusive. Defaults to 3. | `number` | `3` | no |
| error\_threshold\_critical | (Required) Must be 0 or greater. Defaults to 0. | `number` | `0` | no |
| function\_arn | (Required) The Amazon Resource Name (ARN) identifying the Lambda function. | `string` | n/a | yes |
| function\_name | (Required) The name identifying the Lambda function. | `string` | n/a | yes |
| function\_timeout | (Required) The amount of time the Lambda function can run in seconds. | `number` | n/a | yes |
| policy\_id | (Required) The ID of the policy where this condition should be used. | `string` | n/a | yes |
| runbook\_url | (Optional) Runbook URL to display in notifications. | `string` | `null` | no |
| since\_value | (Optional) The value to be used in the SINCE <X> MINUTES AGO clause for the NRQL query. Must be between 1 and 20. Defaults to 3. | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| error\_rate\_min\_alert\_condition\_id | The ID of the NRQL error rate alert condition. |
| execution\_time\_alert\_condition\_id | The ID of the NRQL execution time alert condition. |

<!-- markdownlint-restore -->
