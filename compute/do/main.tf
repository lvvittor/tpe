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

resource "digitalocean_firewall" "web" {
  name = "hello-world-only-allow-ssh-http-and-https"

  droplet_ids = [digitalocean_droplet.hello_world.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}