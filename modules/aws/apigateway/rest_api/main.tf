resource "aws_api_gateway_rest_api" "this" {
  name        = var.name
  description = var.description
  body        = var.body

  endpoint_configuration {
    types = [var.endpoint_type]
  }

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.this.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "this" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  deployment_id = aws_api_gateway_deployment.this.id
  stage_name    = var.stage_name
  description   = var.stage_description
  variables     = var.stage_variables

  tags = merge(
    {
      Name = "${var.name}-${var.stage_name}"
    },
    var.tags
  )
}
