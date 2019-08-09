provider "aws" {
  region  = "eu-west-1"
  profile = "devops01"
}

module "my_vpc" {
  source   = "../modules/vpc"
  vpc_cidr = "10.0.0.0/20"
  tenancy  = "default"
  vpc_id   = "${module.my_vpc.vpc_id}"
  //aws_instance = "${module.my_vpc.instance}"
  subnet_cidr = "10.0.1.0/28"
}



