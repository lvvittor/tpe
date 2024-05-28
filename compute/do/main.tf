resource "digitalocean_droplet" "hello_world" {
  image      = var.droplet_image
  name       = var.droplet_name
  region     = var.droplet_region
  size       = var.droplet_size
  backups    = false
  monitoring = true
  ssh_keys = [
    var.ssh_fingerprint
  ]

  user_data = "${file("./cfg/user_data.sh")}"

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.ssh_private_key_path)
    timeout     = "2m"
  }
}