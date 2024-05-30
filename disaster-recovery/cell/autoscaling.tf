resource "aws_launch_template" "template" {
  name_prefix   = "hello-world-launch-template"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  user_data     = filebase64("./cfg/user_data.sh")

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [module.instances_security_group.security_group_id]
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }
}

resource "aws_autoscaling_group" "hello_world_asg" {
  name             = "hello-world-asg"
  desired_capacity = 2
  max_size         = 5
  min_size         = 1

  # availability_zones = module.vpc.azs
  vpc_zone_identifier = module.vpc.public_subnets

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 30
  force_delete              = true

  target_group_arns = [aws_lb_target_group.main.arn]
}

resource "aws_autoscaling_policy" "scale_up_policy" {
  name                      = "scale-up-policy"
  scaling_adjustment        = 1
  adjustment_type           = "ChangeInCapacity"
  cooldown                  = 30

  autoscaling_group_name = aws_autoscaling_group.hello_world_asg.name
}

resource "aws_autoscaling_policy" "scale_down_policy" {
  name               = "scale-down-policy"
  scaling_adjustment = -1
  adjustment_type    = "ChangeInCapacity"
  cooldown           = 30

  autoscaling_group_name = aws_autoscaling_group.hello_world_asg.name
}


