variable "aws_config" {
  description = "AWS configuration"
  type = object({
    access_key = string
    secret_key = string
  })
}
variable subdomain {
  type        = string
  description = "Subdomain for our cluster"
}

variable domain {
  type        = string
  description = "Domain for our cluster"
}