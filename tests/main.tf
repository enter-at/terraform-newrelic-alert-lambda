terraform {
  required_version = "~> 0.12"

  backend "local" {}
}

provider "newrelic" {
  version    = "~> 2.0.0"
  api_key    = "12345"
  account_id = "12345"
}

module "alerts" {
  source           = "../"
  function_name    = "test-service"
  function_arn     = "arn:*:lambda:eu-central-1:*:function:test-service"
  function_timeout = 0
  policy_id        = "1"
}
