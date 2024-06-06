variable "aws_config" {
  description = "AWS configuration"
  type = object({
    access_key = string
    secret_key = string
  })
}

variable region {
  type        = string
  description = "AWS region"
}

variable subdomain {
  type        = string
  description = "Subdomain for our cluster"
}

variable domain {
  type        = string
  description = "Domain for our cluster"
}

variable primary_lb_dns {
  type        = string
  description = "The DNS of our primary lb"
}

variable secondary_lb_dns {
  type        = string
  description = "The DNS of our secondary lb"
}

variable primary_lb_zone {
  type        = string
  description = "The zone_id of our primary lb"
}

variable secondary_lb_zone {
  type        = string
  description = "The zone_id of our secondary lb"
}