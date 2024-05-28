module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.8.0"

  name = "hello_world_vpc"

  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  public_dedicated_network_acl = true
  public_inbound_acl_rules     = local.network_acls["public_inbound"]
  public_outbound_acl_rules    = local.network_acls["public_outbound"]

  private_dedicated_network_acl = false

  create_igw = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_ipv6 = false

  enable_nat_gateway = true
  single_nat_gateway = false

  tags = {
    author = "John Doe"
    version = "1.0.0"
  }
}