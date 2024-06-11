output "s3_bucket_endpoint" {
  value = aws_s3_bucket_website_configuration.this.website_endpoint
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "s3_bucket_id" {
  value = aws_s3_bucket.this.id
}

output "s3_bucket_domain_name" {
  value = aws_s3_bucket.this.bucket_domain_name
}