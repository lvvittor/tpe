output "s3_bucket_endpoint" {
  value = module.s3.s3_bucket_endpoint
}

output "cloudfront_distribution" {
  value = module.cloudfront.cloudfront_distribution
}