module "event_queue" {
  source = "../../sqs/queue"

  name               = "${var.name}-queue"
  visibility_timeout = var.visibility_timeout
  message_retention  = var.message_retention_seconds
  tags               = var.tags
}

resource "aws_sqs_queue_policy" "eventbridge_send" {
  queue_url = module.event_queue.queue_url

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowEventBridgeSend"
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action   = "sqs:SendMessage"
        Resource = module.event_queue.queue_arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = module.rule.rule_arn
          }
        }
      }
    ]
  })
}

module "log_group" {
  source = "../../cloudwatch/log_group"

  name              = "/aws/eventbridge/${var.name}"
  retention_in_days = var.log_retention_days
  tags              = var.tags
}

module "rule" {
  source = "../rule"

  name                = "${var.name}-rule"
  description         = var.rule_description != "" ? var.rule_description : "EventBridge rule for ${var.name}"
  schedule_expression = var.schedule_expression
  event_pattern       = var.event_pattern
  targets = [
    {
      arn       = module.event_queue.queue_arn
      target_id = "${var.name}-sqs-target"
    }
  ]
  tags = var.tags
}
