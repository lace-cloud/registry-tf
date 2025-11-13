resource "aws_sns_topic" "this" {
  name                        = var.topic_name
  display_name                = var.display_name
  fifo_topic                  = var.fifo_topic
  content_based_deduplication = var.content_based_deduplication

  kms_master_key_id = var.kms_master_key_id

  delivery_policy = var.delivery_policy

  tags = merge(
    {
      Name        = var.topic_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

resource "aws_sns_topic_subscription" "this" {
  for_each = { for idx, sub in var.subscriptions : idx => sub }

  topic_arn = aws_sns_topic.this.arn
  protocol  = each.value.protocol
  endpoint  = each.value.endpoint

  filter_policy         = lookup(each.value, "filter_policy", null)
  filter_policy_scope   = lookup(each.value, "filter_policy_scope", null)
  raw_message_delivery  = lookup(each.value, "raw_message_delivery", false)
  redrive_policy        = lookup(each.value, "redrive_policy", null)
  subscription_role_arn = lookup(each.value, "subscription_role_arn", null)
}

resource "aws_sns_topic_policy" "this" {
  count = var.topic_policy != null ? 1 : 0

  arn    = aws_sns_topic.this.arn
  policy = var.topic_policy
}
