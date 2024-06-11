
resource "aws_route53_record" "primary" {
  zone_id        = data.aws_route53_zone.prebuilt_hosted_zone.zone_id
  name           = "${var.subdomain}.${var.domain}"
  type           = "A"
  set_identifier = "${var.subdomain}-primary"

  alias {
    name                   = var.primary_lb_dns
    zone_id                = var.primary_lb_zone
    evaluate_target_health = true
  }

  failover_routing_policy {
    type = "PRIMARY"
  }
}

resource "aws_route53_record" "secondary" {
  zone_id        = data.aws_route53_zone.prebuilt_hosted_zone.zone_id
  name           = "${var.subdomain}.${var.domain}"
  type           = "A"
  set_identifier = "${var.subdomain}-secondary"

  alias {
    name                   = var.secondary_lb_dns
    zone_id                = var.secondary_lb_zone
    evaluate_target_health = true
  }

  failover_routing_policy {
    type = "SECONDARY"
  }
}

resource "aws_route53_health_check" "primary" {
  fqdn              = "${var.subdomain}.${var.domain}"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "1"
  request_interval  = "10"

  tags = {
    Name = "failover-healthcheck"
  }
}

