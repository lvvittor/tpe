variable "aws_config" {
  description = "AWS configuration"
  type = object({
    access_key = string
    secret_key = string
  })
}

variable "do_config" {
  description = "Digital Ocean configuration"
  type = object({
    do_token = string
    ssh_fingerprint = string
    ssh_private_key_path = string
  })
  
}
