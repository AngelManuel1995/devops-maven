variable "PATH_TO_PUBLIC_KEY" {
  type    = string
  default = "mykey.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
	type    = string
	default = "mykey"
}

variable "SG_NAME" {
	type = string
	default = "ssh_connection"
}

variable "INGRESS_RULE" {}

variable "AMIS" {
	type = map
	default = {
		us-east-1 = "ami-00e87074e52e6c9f9"
		us-east-2 = "ami-00f8e2c955f7ffa9b"
		us-west-2 = "ami-0686851c4e7b1a8e1"
		eu-west-1 = "ami-04f5641b0d178a27a"
	}
}

variable "AWS_REGION" {
	type = string
	default = "us-east-2"
}

variable INSTANCE_TYPE {
	type    = string
	default = "t2.micro"
}

variable INSTANCE_USERNAME {
	type = string
	default = "ec2-user"
}