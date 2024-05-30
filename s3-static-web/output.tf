output "s3_bucket_endpoint" {
  value = aws_s3_bucket_website_configuration.this.website_endpoint
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.this.domain_name
}