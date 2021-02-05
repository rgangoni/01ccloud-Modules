resource "aws_instance" "Instance" {
  ami                  = "${var.ami}" 
  instance_type        = "${var.instance_type}"
  subnet_id            = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  associate_public_ip_address = true
  key_name             = "${var.key_name}"
  
  
  tags = {
    Name = "${var.instance_name}"
  }
}

resource "aws_eip" "instance-eip" {
  instance = "${aws_instance.Instance.id}"
  vpc      = true
  tags = {
       Name = "${var.eip_name}"
   }
}
