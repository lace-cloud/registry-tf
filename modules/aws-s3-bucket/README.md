# AWS S3 Bucket Module

A production-ready Terraform module for creating and managing AWS S3 buckets with security best practices.

## Features

- ✅ Versioning support
- ✅ Server-side encryption (AES256 or KMS)
- ✅ Public access blocking
- ✅ Lifecycle policies
- ✅ Comprehensive tagging
- ✅ Configurable security settings

## Usage

```hcl
module "my_bucket" {
  source = "git::https://github.com/lace-cloud/registry-tf.git//test-modules/aws-s3-bucket?ref=<commit-sha>"

  bucket_name         = "my-app-data-bucket"
  environment         = "production"
  enable_versioning   = true
  enable_encryption   = true
  block_public_access = true

  lifecycle_rules = [
    {
      id      = "archive-old-objects"
      enabled = true
      prefix  = "logs/"
      transitions = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
        {
          days          = 90
          storage_class = "GLACIER"
        }
      ]
      expiration_days = 365
    }
  ]

  additional_tags = {
    Project = "MyApp"
    Owner   = "DataTeam"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket_name | Name of the S3 bucket | `string` | n/a | yes |
| environment | Environment name | `string` | `"dev"` | no |
| enable_versioning | Enable versioning | `bool` | `true` | no |
| enable_encryption | Enable encryption | `bool` | `true` | no |
| kms_key_id | KMS key ID | `string` | `null` | no |
| block_public_access | Block public access | `bool` | `true` | no |
| lifecycle_rules | Lifecycle rules | `list(object)` | `[]` | no |
| additional_tags | Additional tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The ID of the bucket |
| bucket_arn | The ARN of the bucket |
| bucket_domain_name | The bucket domain name |
| bucket_regional_domain_name | The bucket regional domain name |
| bucket_region | The AWS region |

## Security Best Practices

This module implements several AWS security best practices:

1. **Public Access Blocking**: Prevents accidental public exposure
2. **Encryption at Rest**: Supports both AES256 and KMS encryption
3. **Versioning**: Protects against accidental deletions
4. **Lifecycle Policies**: Manages data retention and cost optimization

## License

MIT

