provider "aws" {
  region     = "ap-south-1"

}

module "my_vpc" { 
    source    = "F:/BerryBytesKeys/Terraform/modules/vpc"
    vpc_name = "Prod"
    vpc_cidr_block = "192.168.0.0/24"
    public_cidr_block_1 = "192.168.0.16/28"
    availability_zone = "ap-south-1a"
    vpc_id = "${module.my_vpc.vpc_id}"
    
}

module "my_ec2" {
    source = "F:/BerryBytesKeys/Terraform/modules/ec2"
    ami = "ami-0db0b3ab7df22e366"
    key_name = "Terraform"
    instance_name = "Instance1"
    instance_type = "t2.micro"
    vpc_security_group_ids = "${module.my_SecurityGroup.vpc_security_group_ids}"
    subnet_id = "${module.my_vpc.subnet_id}"
    eip_name  = "myec2"
    
}

module "my_SecurityGroup" {
    source = "F:/BerryBytesKeys/Terraform/modules/SecurityGroup"
    security_group_name = "vpn_server"
    vpc_id = "${module.my_vpc.vpc_id}"
    
}

