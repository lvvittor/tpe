data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical Owner ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"] # hardware virtual machine
  }
}

data "aws_vpc" "vpc" {
  default = true
}
