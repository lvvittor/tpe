variable "aws_config" {
  description = "AWS configuration"
  type = object({
    access_key = string
    secret_key = string
  })
}

variable "domain_name" {
  type        = string
  description = "Domain name"
  default     = "itbamafia.com"
}