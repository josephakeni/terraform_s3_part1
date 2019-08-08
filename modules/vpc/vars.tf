

variable "tenancy" {
  default = "default"
}

variable "vpc_id" {}

variable "RDS_PASSWORD" {
  default = "password"
}

variable "subnet_cidr" {
  default = "10.0.1.0/20"
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/20"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/20"
}

