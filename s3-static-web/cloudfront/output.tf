output "cloudfront_distribution" {
  description = "The CloudFront distribution"
  value       = aws_cloudfront_distribution.this
}

output "cloudfront_oai" {
  description = "The ID of the CloudFront OAI"
  value       = aws_cloudfront_origin_access_identity.this
}