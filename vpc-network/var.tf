variable "aws_config" {
  description = "AWS configuration"
  type = object({
    access_key = string
    secret_key = string
  })
}

variable "region" {
    type = string
    description = "AWS Region"
    default = "us-east-1"
}