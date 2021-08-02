resource "aws_instance" "docker_server" {
  ami             = lookup(var.AMIS, var.AWS_REGION)
  instance_type   = var.INSTANCE_TYPE
  key_name        = aws_key_pair.mykey.key_name
  security_groups = [ aws_security_group.ssh_connection.name ]

  provisioner "file" {
    source      = "scripts/docker-install.sh"
    destination = "/tmp/docker-install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/docker-install.sh",
      "sudo /tmp/docker-install.sh",
      "sudo usermod -aG dockerroot dockeradmin",
      "sudo chmod 666 /var/run/docker.sock",
      "docker run -d --name test-tomcat-server -p 8080:8080 tomcat:latest"
    ]
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }

}