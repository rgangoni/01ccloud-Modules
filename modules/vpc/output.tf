output "vpc_id" {
    value = "${aws_vpc.Requester.id}"
}

output "gateway_id" {
    value = "${aws_internet_gateway.vpn-igw.id}"
}

output "subnet_id" {
    value = "${aws_subnet.vpn-subnet-public-1.id}"
}