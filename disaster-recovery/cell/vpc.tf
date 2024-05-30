module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.8.0"

  cidr = "10.0.0.0/16"

  name = "vpc"

  azs             = var.vpc_azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  create_igw = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = false

  tags = local.tags
}
