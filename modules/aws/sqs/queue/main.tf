resource "aws_sqs_queue" "this" {
  name                        = var.fifo_queue ? "${var.name}.fifo" : var.name
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.fifo_queue ? var.content_based_deduplication : null
  visibility_timeout_seconds  = var.visibility_timeout
  message_retention_seconds   = var.message_retention
  max_message_size            = var.max_message_size
  delay_seconds               = var.delay_seconds
  receive_wait_time_seconds   = var.receive_wait_time
  kms_master_key_id           = var.kms_key_id
  sqs_managed_sse_enabled     = var.kms_key_id == null ? true : null

  dynamic "redrive_policy" {
    for_each = var.dead_letter_queue_arn != null ? [1] : []
    content {
      dead_letter_target_arn = var.dead_letter_queue_arn
      max_receive_count      = var.max_receive_count
    }
  }

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
