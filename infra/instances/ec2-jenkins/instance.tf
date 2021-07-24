resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "manager" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE
  key_name = aws_key_pair.mykey.key_name
  security_groups = [ aws_security_group.ssh_connection.name ]

	provisioner "file" {
		source = "jenkins-install.sh"
		destination = "/tmp/jenkins-install.sh"
	}

	provisioner "remote-exec" {
		inline = [
			"chmod +x /tmp/jenkins-install.sh",
			"sudo /tmp/jenkins-install.sh"
		]
	}
	
	connection {
		type = "ssh"
		host = self.public_ip
		user = var.INSTANCE_USERNAME
		private_key = file(var.PATH_TO_PRIVATE_KEY)
	}

}