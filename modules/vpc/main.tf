resource "aws_vpc" "Requester" {
    cidr_block = "${var.vpc_cidr_block}"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"


    tags = {
        Name = "${var.vpc_name}"
    }


}

resource "aws_subnet" "vpn-subnet-public-1" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.public_cidr_block_1}"    
    map_public_ip_on_launch = "true"  
    availability_zone = "${var.availability_zone}"  
   
    tags = {
        Name = "${var.vpc_name}-subnet"
    }

 
}

resource "aws_internet_gateway" "vpn-igw" {
    vpc_id = "${var.vpc_id}"
   
    tags = {
        Name = "${var.vpc_name}-vpn-igw"
    }


}

resource "aws_route_table" "RequesterRT" {
    vpc_id = "${var.vpc_id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.vpn-igw.id}"
    }

    tags =  {
        Name = "${var.vpc_name}-Routetable"
    }


}

## Associate Route table
resource "aws_route_table_association" "vpn-crta-public-subnet-1"{
    subnet_id = "${aws_subnet.vpn-subnet-public-1.id}"
    route_table_id = "${aws_route_table.RequesterRT.id}"
}