INGRESS_RULE = [
	{
		FROM_PORT   = "22"
		TO_PORT     = "22"
		PROTOCOL    = "tcp"
		CIDR_BLOCKS = ["0.0.0.0/0"]  
	},
	{
		FROM_PORT   = "80"
		TO_PORT     = "80"
		PROTOCOL    = "tcp"
		CIDR_BLOCKS = ["0.0.0.0/0"]  
	},
	{
		FROM_PORT   = "8080"
		TO_PORT     = "8080"
		PROTOCOL    = "tcp"
		CIDR_BLOCKS = ["0.0.0.0/0"]  
	}
]

EGRESS_RULE = [
	{
		FROM_PORT   = 0
		TO_PORT     = 0
		PROTOCOL    = "-1"
		CIDR_BLOCKS = ["0.0.0.0/0"]  
	}
]