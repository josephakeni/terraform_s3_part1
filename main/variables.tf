variable "installApp" {
  type = "map"
  default = {
    "nginx"  = "sudo yum update -y && sudo amazon-linux-extras install nginx1.12 -y && sudo systemctl start nginx"
    "apache" = "sudo yum update -y && sudo yum install httpd -y && sudo service httpd start"
  }
}