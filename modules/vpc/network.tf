############################################
#           VPC                            #
############################################
resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"
  enable_dns_support=true
  enable_dns_hostnames = true
  tags ={
    Name = "main"
  }
}

############################################
#           SUBNETS                        #
############################################
resource "aws_subnet" "main-public-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "main-public-1"
  }
}

resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "${var.private_subnet_cidr}"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "main-private-1"
  }
}

############################################
#           INTERNET GATEWAY               #
############################################
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

# route tables
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id
  route {
    /* IP routing is destination based. 
    The destination must be an IP prefix in CIDR notaion e.g 0.0.0.0/0 */
    # cidr_block = Destionation.
    cidr_block = "0.0.0.0/0"
    /* The target must be an AWS network resource such as 
    internet gateway or Elastic Network Interface */
    # gateway_id= Target
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "main-public-1"
  }
}

####################################
#  ROUTE TABLE ASSOCIATION PUBLIC  #
####################################
/*
If you do not explicitly associate a subnet with a route table 
you created, AWS will implicitly associate it with the main route table
*/
resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public.id
}



############################################
#           NAT SECURITY GROUP             #
############################################
resource "aws_security_group" "nat" {
    name = "vpc_nat"
    description = "Allow traffic to pass from the private subnet to the internet"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    
    vpc_id = "${aws_vpc.main.id}"

    tags ={
        Name = "NATSecGroup"
    }
}


