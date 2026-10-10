# AWS S3 Bucket

AWS S3 bucket with versioning, KMS encryption, public access block, lifecycle rules, and optional CORS configuration

## Usage

```hcl
module "s3_bucket" {
  source  = "lace.cloud/lace/s3-bucket/aws"
  version = "1.0.1"

  # inputs: see variables.tf
}
```

Inputs are declared in `variables.tf` and outputs in `outputs.tf`. Resolving `lace.cloud/...` needs a registry credential (`lace login`, or a service token with registry read access in CI).
