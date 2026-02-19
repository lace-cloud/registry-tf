resource "aws_lambda_function" "this" {
  function_name = var.function_name
  runtime       = var.runtime
  handler       = var.handler
  role          = var.role_arn
  filename      = var.filename
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
  memory_size   = var.memory_size
  timeout       = var.timeout
  architectures = var.architectures
  layers        = var.layers
  publish       = var.publish

  dynamic "environment" {
    for_each = length(var.environment_variables) > 0 ? [1] : []
    content {
      variables = var.environment_variables
    }
  }

  dynamic "vpc_config" {
    for_each = var.subnet_ids != null ? [1] : []
    content {
      subnet_ids         = var.subnet_ids
      security_group_ids = var.security_group_ids
    }
  }

  tags = merge(
    {
      Name = var.function_name
    },
    var.tags
  )
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention_in_days

  tags = merge(
    {
      Name = var.function_name
    },
    var.tags
  )
}
