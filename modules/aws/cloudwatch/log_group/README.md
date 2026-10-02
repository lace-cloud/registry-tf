# AWS CloudWatch Log Group

A CloudWatch log group with configurable retention, log group class and optional KMS encryption. The log group is tagged with `Name = <name>` plus any `tags` you pass.

## Usage

```hcl
module "logs" {
  source  = "lace.cloud/lace/cloudwatch-log-group/aws"
  version = "1.1.0"

  name              = "/app/my-service"
  retention_in_days = 30

  tags = {
    Environment = "production"
  }
}
```

## Inputs

| Name | Type | Default | Description |
|---|---|---|---|
| `name` | `string` | required | Name of the log group |
| `retention_in_days` | `number` | `14` | Days to keep log events (`0` keeps them forever) |
| `log_group_class` | `string` | `"STANDARD"` | `STANDARD` or `INFREQUENT_ACCESS` |
| `kms_key_id` | `string` | `null` | KMS key ARN to encrypt the log group |
| `skip_destroy` | `bool` | `false` | Keep the log group when the module is destroyed |
| `tags` | `map(string)` | `{}` | Extra tags |

## Outputs

| Name | Description |
|---|---|
| `log_group_name` | Name of the log group |
| `log_group_arn` | ARN of the log group |
