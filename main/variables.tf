variable "installApp" {
  type = "map"
  default = {
    "nginx"  = "sudo yum update -y && sudo amazon-linux-extras install nginx1.12 -y && sudo systemctl start nginx"
    "apache" = "sudo yum update -y && sudo yum install httpd -y && sudo service httpd start"
  }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/20"
}

variable "tenancy" {
  default = "default"
}

variable "subnet_cidr" {
  default = "10.0.1.0/28"
}