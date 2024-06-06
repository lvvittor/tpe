output "load_balancer_dns_name" {
  value = aws_lb.main.dns_name
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.hello_world_asg.name
}
output "lb_dns" {
  value = aws_lb.main.dns_name
}

output "lb_zone_id" {
  value = aws_lb.main.zone_id
}