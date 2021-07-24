output "instance_public_ip" {
  value = aws_instance.manager.*.public_ip
}
