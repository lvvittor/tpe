variable "aws_config" {
  description = "AWS configuration"
  type = object({
    access_key = string
    secret_key = string
  })
}