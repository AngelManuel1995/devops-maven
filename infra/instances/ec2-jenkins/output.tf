output "instance_public_ip" {
  value = aws_instance.manager.*.public_ip
}
output "instance_tomcat_public_ip" {
  value = aws_instance.tomcat_service_1.*.public_ip
}
output "instance_docker_server_public_ip" {
  value = aws_instance.docker_server.*.public_ip
}