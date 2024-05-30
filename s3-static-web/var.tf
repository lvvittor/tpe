variable "aws_config" {
  description = "AWS configuration"
  type = object({
    access_key = string
    secret_key = string
  })
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "ap-south-1"
}

variable "s3_name" {
  type        = string
  description = "Name of the S3 bucket"
  default     = "s3-static-web"
}