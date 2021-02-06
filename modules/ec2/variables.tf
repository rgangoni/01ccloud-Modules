#variable "alarms_email" {}
variable "instance_name" {}
variable "instance_type" {
   default = "t2.micro"
}
variable "subnet_id" {}
variable "vpc_security_group_ids" {}
variable "eip_name" {}

variable "volume_size" {
    default = "1024"
}

variable "storage_type" {
    default = "io1"
}

variable "iops" {
    default = "20000"
}
variable "name" {
    default = "usm"
}
variable "name_regex" {
    default = "AlienVault_USM_*"
}

variable "owners" {
    default = ["042528429665"]
}
