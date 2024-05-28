resource "aws_instance" "hello_world" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    vpc_security_group_ids = ["${aws_security_group.hello_world.id}"]
    user_data = "${file("./cfg/user_data.sh")}"

    tags = {
        Name = "hello_world"
    }
}

resource "aws_security_group" "hello_world" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}