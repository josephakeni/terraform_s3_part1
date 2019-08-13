provider "aws" {
  region  = "eu-west-1"
  profile = "devops01"
}

module "my_vpc" {
  source   = "../modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  tenancy  = "${var.tenancy}"
  vpc_id   = "${module.my_vpc.vpc_id}"
  subnet_cidr = "${var.subnet_cidr}"
}



