output "url" {
  value = "http://${digitalocean_droplet.hello_world.ipv4_address}"
}