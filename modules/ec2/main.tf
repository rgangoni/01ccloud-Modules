data "aws_ami" "usm-ami" {
  executable_users = ["self"]
  name_regex       = var.name_regex
  owners           = var.owners
}

resource "aws_instance" "Instance" {
  ami                  = data.aws_ami.usm-ami.id
  instance_type        = "${var.instance_type}"
  subnet_id            = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  associate_public_ip_address = true
  
  tags = local.local_tags

  ebs_block_device {
   device_name = "/dev/sda1"
   volume_size = var.volume_size
   volume_type = var.storage_type
   iops        = var.iops
   delete_on_termination = "true"
   }
  
  
}

resource "aws_eip" "instance-eip" {
  instance = "${aws_instance.Instance.id}"
  vpc      = true
  tags = {
       Name = "${var.eip_name}"
   }
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_eip.instance-eip.public_ip
}

