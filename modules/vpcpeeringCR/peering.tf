

data "aws_vpc" "Requester" {
   filter {
     name = "tag:Name"
     values = ["Prod-vpn-vpc"]
   }
}
data "aws_vpc" "Accepter" {
   provider = "aws.central"
   filter {
     name = "tag:Name"
     values = ["Dev-vpn-vpc"]
   }
}

resource "aws_vpc_peering_connection" "peering-vpc" {
  peer_owner_id = "${var.peer_owner_id}"
  vpc_id        = "${data.aws_vpc.Requester.id}" 
  peer_vpc_id   = "${data.aws_vpc.Accepter.id}"
  peer_region   = "${var.peer_region}"
  auto_accept   =  false
  tags = {
    Name = "peering-vpn-test"
  }
}

## Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                     = "aws.central"
  vpc_peering_connection_id    = "${aws_vpc_peering_connection.peering-vpc.id}"
  auto_accept                  = true
  tags = {
    side = "Accepter"
    Name = "peering-vpn-test"
  }
}
