variable "domain_name" {
  type        = string
  description = "Domain name"
}

variable "s3_origin_id" {
  type        = string
  description = "S3 origin ID"
}

variable "s3_bucket_arn" {
  type        = string
  description = "S3 bucket ARN"
}

variable "s3_domain_name" {
  type        = string
  description = "S3 domain name"
}

variable "acm_certificate_arn" {
  type        = string
  description = "ACM certificate ARN"
}