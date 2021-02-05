#variable "alarms_email" {}
variable "instance_name" {}
variable "instance_type" {
   default = "t2.micro"
}
variable "ami" {}
variable "key_name" {}
variable "subnet_id" {}
variable "vpc_security_group_ids" {}
variable "eip_name" {}

