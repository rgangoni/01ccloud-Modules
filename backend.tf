terraform {
  backend "s3" {
    bucket = "salad-prod-terraform-state"
    key = "usm-terraform.tfstate"
    region = "eu-west-2"
    encrypt = true
  }
}
