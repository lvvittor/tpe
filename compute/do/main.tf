resource "digitalocean_vpc" "hello_world" {
  name   = var.vpc_name
  region = var.droplet_region
}


resource "digitalocean_droplet" "hello_world" {
  image      = var.droplet_image
  name       = var.droplet_name
  region     = var.droplet_region
  size       = var.droplet_size
  backups    = false
  monitoring = true
  vpc_uuid   = digitalocean_vpc.hello_world.id
  ssh_keys = [
    var.ssh_fingerprint
  ]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.ssh_private_key_path)
    timeout     = "2m"
  }
}