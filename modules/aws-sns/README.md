# AWS SNS Topic Module

A production-ready Terraform module for creating AWS SNS topics with subscription management and encryption support.

## Features

- ✅ Standard and FIFO topic support
- ✅ Multiple subscription types (email, SQS, Lambda, HTTP/S)
- ✅ KMS encryption support
- ✅ Content-based deduplication for FIFO topics
- ✅ Custom delivery and topic policies
- ✅ Filter policies for subscriptions
- ✅ Comprehensive tagging

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 4.0 |

## Usage

### Basic Example

```hcl
module "alerts" {
  source = "git::https://github.com/lace-cloud/registry-tf.git//examples/terraform-registry/modules/aws-sns?ref=<commit-sha>"

  topic_name   = "application-alerts"
  display_name = "Application Alerts"

  subscriptions = [
    {
      protocol = "email"
      endpoint = "team@example.com"
    }
  ]
}
```

### Multiple Subscriptions with Filters

```hcl
module "events" {
  source = "git::https://github.com/lace-cloud/registry-tf.git//examples/terraform-registry/modules/aws-sns?ref=<commit-sha>"

  topic_name = "application-events"

  subscriptions = [
    {
      protocol = "sqs"
      endpoint = aws_sqs_queue.high_priority.arn
      filter_policy = jsonencode({
        priority = ["high", "critical"]
      })
      raw_message_delivery = true
    },
    {
      protocol = "lambda"
      endpoint = aws_lambda_function.processor.arn
    }
  ]
}
```

### FIFO Topic with Encryption

```hcl
module "orders" {
  source = "git::https://github.com/lace-cloud/registry-tf.git//examples/terraform-registry/modules/aws-sns?ref=<commit-sha>"

  topic_name                  = "order-events.fifo"
  fifo_topic                  = true
  content_based_deduplication = true
  kms_master_key_id          = aws_kms_key.sns.id

  subscriptions = [
    {
      protocol = "sqs"
      endpoint = aws_sqs_queue.orders.arn
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| topic_name | Name of the SNS topic | `string` | n/a | yes |
| display_name | Display name for the SNS topic | `string` | `""` | no |
| fifo_topic | Whether the topic is FIFO (first-in-first-out) | `bool` | `false` | no |
| content_based_deduplication | Enable content-based deduplication for FIFO topics | `bool` | `false` | no |
| kms_master_key_id | ID of AWS KMS key for server-side encryption | `string` | `null` | no |
| delivery_policy | SNS delivery policy JSON | `string` | `null` | no |
| topic_policy | SNS topic policy JSON | `string` | `null` | no |
| subscriptions | List of subscriptions to create | `list(object)` | `[]` | no |
| environment | Environment name (e.g., dev, staging, production) | `string` | `"production"` | no |
| tags | Additional tags for all resources | `map(string)` | `{}` | no |

### Subscription Object

```hcl
{
  protocol                  = string           # Required: email, sqs, lambda, http, https, sms
  endpoint                  = string           # Required: destination for messages
  filter_policy            = optional(string) # JSON filter policy
  filter_policy_scope      = optional(string) # MessageAttributes or MessageBody
  raw_message_delivery     = optional(bool)   # Deliver raw JSON (SQS/HTTP only)
  redrive_policy           = optional(string) # Dead-letter queue policy
  subscription_role_arn    = optional(string) # IAM role for Firehose delivery
}
```

## Outputs

| Name | Description |
|------|-------------|
| topic_arn | ARN of the SNS topic |
| topic_id | ID of the SNS topic |
| topic_name | Name of the SNS topic |
| topic_owner | AWS account ID of the topic owner |
| subscription_arns | ARNs of the SNS topic subscriptions |

## Supported Subscription Protocols

- **email**: Send notifications to email addresses (requires confirmation)
- **sqs**: Send to SQS queues
- **lambda**: Trigger Lambda functions
- **http/https**: POST to HTTP endpoints
- **sms**: Send SMS messages
- **application**: Mobile push notifications
- **firehose**: Stream to Kinesis Data Firehose

## IAM Permissions for Subscriptions

### Lambda Function Policy

```hcl
resource "aws_lambda_permission" "sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.processor.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = module.sns.topic_arn
}
```

### SQS Queue Policy

```hcl
resource "aws_sqs_queue_policy" "sns" {
  queue_url = aws_sqs_queue.target.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "sns.amazonaws.com"
      }
      Action   = "sqs:SendMessage"
      Resource = aws_sqs_queue.target.arn
      Condition = {
        ArnEquals = {
          "aws:SourceArn" = module.sns.topic_arn
        }
      }
    }]
  })
}
```

## Encryption with KMS

```hcl
resource "aws_kms_key" "sns" {
  description = "KMS key for SNS encryption"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action   = "kms:*"
        Resource = "*"
      },
      {
        Sid    = "Allow SNS to use the key"
        Effect = "Allow"
        Principal = {
          Service = "sns.amazonaws.com"
        }
        Action = [
          "kms:Decrypt",
          "kms:GenerateDataKey"
        ]
        Resource = "*"
      }
    ]
  })
}
```

## Filter Policy Examples

### Attribute-based Filtering

```hcl
filter_policy = jsonencode({
  event_type = ["order_placed", "order_shipped"]
  region     = ["us-east-1", "us-west-2"]
  price      = [{ "numeric": [">=", 100] }]
})
```

### Message Body Filtering

```hcl
filter_policy = jsonencode({
  customer = {
    tier = ["premium", "enterprise"]
  }
})
filter_policy_scope = "MessageBody"
```

## Security Considerations

- Enable encryption with KMS for sensitive data
- Use least privilege IAM policies for subscriptions
- Implement filter policies to reduce unnecessary processing
- Use HTTPS endpoints for HTTP subscriptions
- Enable CloudTrail logging for SNS API calls
- Regularly review and rotate KMS keys
- Validate subscription endpoints before approval

## FIFO Topic Considerations

- FIFO topic names must end with `.fifo`
- Throughput: 300 messages/second (3000 with batching)
- Messages are delivered exactly once
- Message ordering is preserved per message group
- Content-based deduplication requires message bodies
- All subscriptions must be to FIFO SQS queues

## License

MIT
