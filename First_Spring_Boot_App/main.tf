terraform{
required_providers{
aws = {
   source = "hashicorp/aws"
   version = "~> 4.0
}
}
}

#Configure the AWS provider

provider "aws" {
  region = "${var.aws_region}"
}

provider "aws"
region ="us-west-2"
access-key = "my-access-key"
secret

data "archive_file" "zip" {
  type        = "zip"
  source_file = "FirstSpringBootAPPApplication.java"
  output_path = "FristSpringBoot_lambda.zip"
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "Vardhaman-SpringBoot-Funtion-role-vuy6mnvs"
  assume_role_policy = "${data.aws_iam_policy_document.policy.json}"
}

resource "aws_lambda_function" "lambda" {
  function_name = "Vardhaman-SpringBoot-Function"

  filename         = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"

  role    = "${aws:iam::934755552362:role/service-role/Vardhaman-SpringBoot-Funtion-role-vuy6mnvs}"
  handler = "FirstSpringBootAppApplication.FirstSpringBootAPPApplication"
  runtime = "Java 17"

  environment {
    variables = {
      greeting = "Hello Vardhman- Welcome to FirstSpringBootAPP"
    }
  }
}
