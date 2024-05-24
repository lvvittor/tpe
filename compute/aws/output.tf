output "url" {
  value = "http://${aws_instance.hello_world.public_ip}"
}