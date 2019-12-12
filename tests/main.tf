terraform {
  required_version = ">= 0.12"

  backend "local" {}
}

provider "aws" {
  region = "eu-central-1"
}

module "lambda" {
  source        = "../"
  function_name = "test-service"
  handler       = "service/handler"
  source_dir    = "./"
  runtime       = "nodejs10.x"

  rsync_pattern = [
    "--include=*.js"
  ]
}
