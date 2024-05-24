variable "access_key" {
  type = string
  description = "AWS Access Key"
}

variable "secret_key" {
    type = string
    description = "AWS Secret Key"
}

variable "region" {
    type = string
    description = "AWS Region"
    default = "us-east-1"
}

variable "instance_type" {
    type = string
    description = "Instance Type"
    default = "t2.micro"
}