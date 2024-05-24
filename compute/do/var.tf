variable "do_token" {
  type = string
  description = "DigitalOcean Token"
}

variable "ssh_fingerprint" {
  type = string
  description = "Fingerprint of your SSH key"
}

variable "ssh_private_key_path" {
  type = string
  description = "Path to your SSH private key"
}

variable "droplet_image" {
  type = string
  description = "Image identifier of the OS in DigitalOcean"
  default     = "ubuntu-20-04-x64"
}

variable "droplet_region" {
  type = string
  description = "Droplet region identifier where the droplet will be created"
  default     = "sfo3"
}

variable "droplet_size" {
  type = string
  description = "Droplet size identifier"
  default     = "s-1vcpu-512mb-10gb"
}

variable "droplet_name" {
  type = string
  description = "Name of the droplet"
  default     = "hello_world"
}

variable "vpc_name" {
  type = string
  description = "Name of the VPC"
  default     = "hello_world_vpc"
}