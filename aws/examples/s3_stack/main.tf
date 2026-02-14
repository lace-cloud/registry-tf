module "s3_bucket" {
  source      = "git::https://github.com/lace-cloud/registry-tf.git//aws/s3/s3_bucket?ref=v1.0.0"
  bucket_name = var.bucket_name
  tags = {
    environment = "dev"
    team        = "data-platform"
  }
}

module "s3_bucket_versioning" {
  source      = "git::https://github.com/lace-cloud/registry-tf.git//aws/s3/s3_bucket_versioning?ref=v1.0.0"
  bucket_name = module.s3_bucket.bucket_name
}
