resource "aws_cloudfront_distribution" "this" {
  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  default_root_object = var.default_root_object
  price_class         = var.price_class
  aliases             = var.aliases
  comment             = var.comment
  web_acl_id          = var.web_acl_id

  origin {
    domain_name = var.origin_domain_name
    origin_id   = var.origin_id

    dynamic "s3_origin_config" {
      for_each = var.origin_access_identity != null ? [1] : []
      content {
        origin_access_identity = var.origin_access_identity
      }
    }

    dynamic "custom_origin_config" {
      for_each = var.origin_access_identity == null ? [1] : []
      content {
        http_port              = var.custom_origin_http_port
        https_port             = var.custom_origin_https_port
        origin_protocol_policy = var.origin_protocol_policy
        origin_ssl_protocols   = var.origin_ssl_protocols
      }
    }
  }

  default_cache_behavior {
    allowed_methods        = var.allowed_methods
    cached_methods         = var.cached_methods
    target_origin_id       = var.origin_id
    viewer_protocol_policy = var.viewer_protocol_policy
    compress               = var.compress
    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl

    forwarded_values {
      query_string = var.forward_query_string
      cookies {
        forward = var.forward_cookies
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = var.geo_restriction_type
      locations        = var.geo_restriction_locations
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = var.acm_certificate_arn != null ? "sni-only" : null
    minimum_protocol_version       = var.acm_certificate_arn != null ? var.minimum_protocol_version : null
    cloudfront_default_certificate = var.acm_certificate_arn == null ? true : false
  }

  tags = merge(
    {
      Name = var.origin_id
    },
    var.tags
  )
}
