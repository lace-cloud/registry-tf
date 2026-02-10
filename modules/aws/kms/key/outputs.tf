output "key_id" {
  description = "ID of the KMS key"
  value       = aws_kms_key.this.key_id
}

output "key_arn" {
  description = "ARN of the KMS key"
  value       = aws_kms_key.this.arn
}

output "alias_arn" {
  description = "ARN of the KMS key alias"
  value       = try(aws_kms_alias.this[0].arn, null)
}
