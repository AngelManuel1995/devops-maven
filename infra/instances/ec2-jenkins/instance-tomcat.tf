resource "aws_instance" "tomcat_service_1" {
  ami             = lookup(var.AMIS, var.AWS_REGION)
  instance_type   = var.INSTANCE_TYPE
  key_name        = aws_key_pair.mykey.key_name
  security_groups = [ aws_security_group.ssh_connection.name ]

  provisioner "remote-exec" {
    inline = [
      "mkdir /tmp/users",
      "mkdir /tmp/hosts",
      "mkdir /tmp/manager"
    ]
  }

  provisioner "file" {
    source      = "tomcat-conf-files/.bash_profile"
    destination = "/tmp/.bash_profile"
  }
  provisioner "file" {
    source      = "scripts/java-jdk-installation.sh"
    destination = "/tmp/java-jdk-installation.sh"
  }
  provisioner "file" {
    source      = "tomcat-conf-files/users/tomcat-users.xml"
    destination = "/tmp/users/tomcat-users.xml"
  }
  provisioner "file" {
    source      = "tomcat-conf-files/hosts/context.xml"
    destination = "/tmp/hosts/context.xml"
  }
  provisioner "file" {
    source      = "tomcat-conf-files/manager/context.xml"
    destination = "/tmp/manager/context.xml"
  }
  provisioner "file" {
    source      = "scripts/tomcat-install.sh"
    destination = "/tmp/tomcat-install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/java-jdk-installation.sh",
      "sudo /tmp/java-jdk-installation.sh",
      "chmod +x /tmp/tomcat-install.sh",
      "sudo /tmp/tomcat-install.sh"
    ]
  }

  connection {
		type = "ssh"
		host = self.public_ip
		user = var.INSTANCE_USERNAME
		private_key = file(var.PATH_TO_PRIVATE_KEY)
	}

}