output "vpc_security_group_ids" {
    value = "${aws_security_group.vpn_server.id}"
}