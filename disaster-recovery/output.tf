output "active-load_balancer_dns_name" {
  value = module.active.load_balancer_dns_name
}

output "active-autoscaling_group_name" {
  value = module.active.autoscaling_group_name
}

output "passive-load_balancer_dns_name" {
  value = module.passive.load_balancer_dns_name
}

output "passive-autoscaling_group_name" {
  value = module.passive.autoscaling_group_name
}

