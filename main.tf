terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region     = "eu-west-1"

}


module "usm-vpc" { 
    source    = "./modules/vpc"
    vpc_name = var.vpc-name
    vpc_cidr_block = var.vpc_cidr_block
    public_cidr_block_1 = var.public_cidr_block_1
    availability_zone = "eu-west-1a"
    vpc_id = "${module.usm-vpc.vpc_id}"
    
}

module "usm-ec2" {
    source = "./modules/ec2"
    instance_name = var.instance_name
    instance_type = var.instance_type
    vpc_security_group_ids = "${module.usm_SecurityGroup.vpc_security_group_ids}"
    subnet_id = "${module.usm-vpc.subnet_id}"
    eip_name  = "usm"
    
}

module "usm_SecurityGroup" {
    source = "./modules/SecurityGroup"
    security_group_name = "usm-sg"
    vpc_id = "${module.usm-vpc.vpc_id}"
    trusted-ip = "${var.trusted-ip}"
    
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.usm-ec2.public_ip
}
