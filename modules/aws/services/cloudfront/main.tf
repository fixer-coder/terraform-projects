# ----------------------------------------------------------------------------------------------------------------------
# CREATE THE CODEPIPELINE
# Module is tailored towards deploying from Github source to s3 bucket
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_cloudfront_distribution" "cloudfront_s3" {
  enabled             = true
  default_root_object = var.default_root_object

  origin {
    domain_name = var.bucket_regional_domain_name
    origin_id   = var.bucket_regional_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = var.bucket_regional_domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    minimum_protocol_version       = "TLSv1"
  }
  tags = {
    Environment = "Dev"
  }
}

# resource created for this, new resource that allows our cloudfront resource, Also a connection to s3 bucket
resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = var.cloudfront_origin_access_identity_comment
}
