resource "aws_route53_record" "cloudfront" {
  zone_id = data.aws_route53_zone.prebuilt_hosted_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront_distribution.domain_name
    zone_id                = var.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
