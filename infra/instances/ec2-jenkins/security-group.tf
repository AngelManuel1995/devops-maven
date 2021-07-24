resource "aws_security_group" "ssh_connection" {
	name = var.SG_NAME
	dynamic "ingress" {
		for_each = var.INGRESS_RULE
		content {
			from_port   = ingress.value.FROM_PORT
			to_port     = ingress.value.TO_PORT
			protocol    = ingress.value.PROTOCOL
			cidr_blocks = ingress.value.CIDR_BLOCKS
		}
	}
	
}