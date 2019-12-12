data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "main" {
  name               = var.function_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.tags
}

# Attach a policy for logs.

locals {
  log_group_arns = [
    local.lambda_log_group_arn
  ]
}

data "aws_iam_policy_document" "logs" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = concat(formatlist("%v:*", local.log_group_arns), formatlist("%v:*:*", local.log_group_arns))
  }
}

resource "aws_iam_policy" "logs" {
  name   = "${var.function_name}-logs"
  policy = data.aws_iam_policy_document.logs.json
}

resource "aws_iam_policy_attachment" "logs" {
  name = "${var.function_name}-logs"
  roles = [
    aws_iam_role.main.name
  ]
  policy_arn = aws_iam_policy.logs.arn
}

# Attach an additional policy required for the dead letter config.

data "aws_iam_policy_document" "dead_letter" {
  count = var.dead_letter_config == null ? 0 : 1

  statement {
    effect = "Allow"

    actions = [
      "sns:Publish",
      "sqs:SendMessage",
    ]

    resources = [
      var.dead_letter_config.target_arn,
    ]
  }
}

resource "aws_iam_policy" "dead_letter" {
  count = var.dead_letter_config == null ? 0 : 1

  name   = "${var.function_name}-dl"
  policy = data.aws_iam_policy_document.dead_letter[0].json
}

resource "aws_iam_policy_attachment" "dead_letter" {
  count = var.dead_letter_config == null ? 0 : 1

  name = "${var.function_name}-dl"
  roles = [
    aws_iam_role.main.name
  ]
  policy_arn = aws_iam_policy.dead_letter[0].arn
}

# Attach an additional policy if provided.

resource "aws_iam_policy" "additional" {
  name   = var.function_name
  policy = var.policy.json
}

resource "aws_iam_policy_attachment" "additional" {
  name = var.function_name
  roles = [
    aws_iam_role.main.name
  ]
  policy_arn = aws_iam_policy.additional.arn
}
