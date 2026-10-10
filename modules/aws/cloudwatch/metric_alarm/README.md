# AWS CloudWatch Metric Alarm

AWS CloudWatch Metric Alarm for monitoring and alerting on AWS resource metrics

## Usage

```hcl
module "cloudwatch_metric_alarm" {
  source  = "lace.cloud/lace/cloudwatch-metric-alarm/aws"
  version = "1.0.1"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
