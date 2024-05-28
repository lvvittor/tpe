module "instances_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1.0"

  name        = "instances_security_group"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules        = ["all-all"]

  tags = local.tags
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.8.0"

  cidr = "10.0.0.0/16"

  name = "hello_world_vpc_elb"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  create_igw = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = false

  tags = local.tags
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  instance_count = 3

  name                        = "hello_world_instance"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_ids                  = [for _,v in module.vpc.private_subnets : v]
  vpc_security_group_ids      = [module.instances_security_group.security_group_id]
  associate_public_ip_address = true

  user_data = file("./cfg/user_data.sh")

  tags = local.tags

  depends_on = [module.vpc]
}

module "elb_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1.0"

  name        = "elb_security_group"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  
  egress_rules = ["all-all"]

  tags = local.tags
}

module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "~> 2.0"

  name    = "hello-world-elb"

  subnets = [for _, v in module.vpc.public_subnets : v]
  
  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  security_groups = [module.elb_security_group.security_group_id]

  # attachments
  number_of_instances = 3
  instances = [for _, v in  module.ec2_instances.id : v]

  tags = local.tags

  depends_on = [module.ec2_instances]
}