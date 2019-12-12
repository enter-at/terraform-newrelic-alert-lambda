## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dead_letter_config | (Optional) Nested block to configure the function's dead letter queue. | object | `null` | no |
| description | (Optional) Description of what your Lambda Function does. | string | `null` | no |
| environment | (Optional) The Lambda environment's configuration settings. | object | `null` | no |
| function_name | (Required) A unique name for your Lambda Function. | string | - | yes |
| handler | (Required) The function entrypoint in your code. | string | - | yes |
| layers | (Optional) List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function. | list(string) | `null` | no |
| memory_size | (Optional) Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128. | number | `128` | no |
| policy | (Optional) An additional policy to attach to the Lambda function role. | object | `null` | no |
| reserved_concurrent_executions | (Optional) The amount of reserved concurrent executions for this lambda function. | number | `null` | no |
| rsync_pattern | (Optional) A list of rsync pattern to include or exclude files and directories. | list(string) | `<list>` | no |
| runtime | (Required) The identifier of the function's runtime. | string | - | yes |
| source_dir | (Required) The location of the handler source code. | string | - | yes |
| tags | (Optional) A mapping of tags to assign to the object. | map(string) | `null` | no |
| timeout | (Optional) The amount of time your Lambda Function has to run in seconds. Defaults to 3. | number | `3` | no |
| tracing_config | (Optional) A child block with a single argument mode | object | `null` | no |
| vpc_config | (Optional) Provide this to allow your function to access your VPC. | object | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) identifying the Lambda function. |
| function_name | - |
| invoke_arn | The ARN to be used for invoking the Lambda function |
| role_arn | The ARN of the IAM role created for the Lambda function |
| role_name | The name of the IAM role created for the Lambda function |

