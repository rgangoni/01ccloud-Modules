resource "aws_security_group" "vpn_server" {
  name        = "${var.security_group_name}"
  description = "Allow traffic needed by openvpn"
  
  
  tags = {
    Name = "${var.security_group_name}"
  }
  

  vpc_id = "${var.vpc_id}" 

  // all inbound traffic
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = var.trusted-ip
  }
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = var.trusted-ip
  }

  // https
  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = var.trusted-ip
  }


  // all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
