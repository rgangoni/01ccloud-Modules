variable "bucket-name" {
    default = "salad-prod-terraform-state"
}


variable "vpc-name" {
    default = "usm"
}

variable "vpc_cidr_block" {
    default = "172.20.15.0/24"
}

variable "public_cidr_block_1" {
    default = "172.20.15.0/26"
}


variable "instance_name" {
    default = "usm"
}
variable "instance_type" {
    default = "m4.2xlarge"
}

variable "trusted-ip" {
    default = ["110.44.123.206/32", "58.152.241.88/32"]
}
