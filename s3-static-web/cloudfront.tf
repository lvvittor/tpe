locals {
  s3_origin_id   = "${var.s3_name}-origin"
  s3_domain_name = "${aws_s3_bucket.this.bucket_domain_name}"
}

resource "aws_cloudfront_distribution" "this" {
  origin {
    origin_id   = local.s3_origin_id
    domain_name = local.s3_domain_name
  }

  enabled = true
  default_root_object = "index.html"

  default_cache_behavior {

    target_origin_id = local.s3_origin_id
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
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
    acm_certificate_arn            = sslaws_acm_certificate.this.arn
    ssl_support_method              = "sni-only"
    minimum_protocol_version        = "TLSv1.2_2021"
  }

  price_class = "PriceClass_200"

}
