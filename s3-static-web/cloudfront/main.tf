resource "aws_cloudfront_distribution" "this" {
  origin {
    origin_id   = var.s3_origin_id
    domain_name = var.s3_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  aliases = [ var.domain_name ]

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {

    target_origin_id = var.s3_origin_id
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]

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
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  price_class = "PriceClass_100"

}

resource "aws_s3_bucket_policy" "this" {
  bucket = var.s3_origin_id
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "Allow CloudFront to access the S3 bucket"
}