resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "OAI for ${var.bucket_name}"
}

module "content_bucket" {
  source = "../bucket"

  bucket_name         = var.bucket_name
  enable_versioning   = var.enable_versioning
  enable_encryption   = true
  block_public_access = true
  additional_tags     = var.tags
}

resource "aws_s3_bucket_policy" "oai_access" {
  bucket = module.content_bucket.bucket_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontOAI"
        Effect = "Allow"
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.this.iam_arn
        }
        Action   = "s3:GetObject"
        Resource = "${module.content_bucket.bucket_arn}/*"
      }
    ]
  })
}

module "cdn" {
  source = "../../cloudfront/distribution"

  origin_domain_name     = module.content_bucket.bucket_regional_domain_name
  origin_id              = var.bucket_name
  origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path

  default_root_object = var.default_root_object
  price_class         = var.price_class
  aliases             = var.aliases
  acm_certificate_arn = var.acm_certificate_arn
  comment             = var.comment != "" ? var.comment : "CDN for ${var.bucket_name}"

  viewer_protocol_policy = "redirect-to-https"
  compress               = true
  tags                   = var.tags

  depends_on = [aws_s3_bucket_policy.oai_access]
}
