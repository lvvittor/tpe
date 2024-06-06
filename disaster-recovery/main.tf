module "active" {
  source     = "./cell"
  aws_config = var.aws_config
  region     = "us-east-1"
  vpc_azs    = ["us-east-1a", "us-east-1b"]
}

module "passive" {
  source     = "./cell"
  aws_config = var.aws_config
  region     = "us-west-1"
  vpc_azs    = ["us-west-1a", "us-west-1c"]
}


module "route53" {
  source = "./dns"
  region     = "us-west-1"
  aws_config = var.aws_config
  subdomain=var.subdomain
  domain=var.domain
  primary_lb_dns=module.active.lb_dns
  secondary_lb_dns=module.passive.lb_dns
  primary_lb_zone=module.active.lb_zone_id
  secondary_lb_zone=module.passive.lb_zone_id
}