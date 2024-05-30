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

resource "aws_lb" "main" {
  name               = "hello-world-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.instances_security_group.security_group_id]
  subnets            = module.vpc.public_subnets

  enable_deletion_protection = false

  tags = local.tags
}

resource "aws_lb_target_group" "main" {
  name     = "hello-world-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = local.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }

  tags = local.tags
}