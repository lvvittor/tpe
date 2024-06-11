data "aws_route53_zone" "prebuilt_hosted_zone" {
  name = var.domain_name
}