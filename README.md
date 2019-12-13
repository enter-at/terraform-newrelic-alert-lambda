<!--

  ** DO NOT EDIT THIS FILE
  **
  ** This file was automatically generated by the `build-harness`.
  ** 1) Make all changes to `README.yaml`
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file.
  **

  -->

[<img src="https://res.cloudinary.com/enter-at/image/upload/v1576145406/static/logo-svg.svg" alt="enter-at" width="100">][website]

# terraform-newrelic-alert-lambda [![Build Status](https://github.com/enter-at/terraform-newrelic-alert-lambda/workflows/Lint/badge.svg)](https://github.com/enter-at/terraform-newrelic-alert-lambda/actions) [![Latest Release](https://img.shields.io/github/release/enter-at/terraform-newrelic-alert-lambda.svg)](https://github.com/enter-at/terraform-newrelic-alert-lambda/releases/latest) [![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)


Terraform module designed to facilitate the creation of New Relic AWS Lambda alerts.


---


It's 100% Open Source and licensed under the [APACHE2](LICENSE).





## Usage


**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://github.com/enter-at/terraform-newrelic-alert-lambda/releases).


### Simple Example

```hcl
module "newrelic_alert" {
  source           = "git::https://github.com/enter-at/terraform-newrelic-alert-lambda.git?ref=master"
  function_name    = aws_lambda_function.main.function_name
  function_arn     = aws_lambda_function.main.arn
  function_timeout = aws_lambda_function.main.timeout
  policy_id        = newrelic_alert_policy.main.id
}
```






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




## Share the Love

Like this project? 
Please give it a ★ on [our GitHub](https://github.com/enter-at/terraform-newrelic-alert-lambda)!


## Related Projects

Check out these related projects.

- [terraform-aws-lambda](https://github.com/enter-at/terraform-aws-lambda) - Terraform module designed to facilitate the creation of AWS Lambda functions.



## Help

**Got a question?**

File a GitHub [issue](https://github.com/enter-at/terraform-newrelic-alert-lambda/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/enter-at/terraform-newrelic-alert-lambda/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project, we would love to hear from you!

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!





## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.




### Contributors

|  [![Steffen Leistner][sleistner_avatar]][sleistner_homepage]<br/>[Steffen Leistner][sleistner_homepage] |
|---|

  [sleistner_homepage]: https://github.com/sleistner
  [sleistner_avatar]: https://res.cloudinary.com/enter-at/image/fetch/w_100,h_100,c_thumb/https://github.com/sleistner.png



  [website]: https://github.com/enter-at
