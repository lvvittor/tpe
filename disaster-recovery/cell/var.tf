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
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t2.micro"
}

variable "vpc_azs" {
  type        = list(string)
  description = "Availability Zones"
}