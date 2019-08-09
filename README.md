# terraform_s3_part1

## Classles Inter-Domain Routing (CIDR)
Given the VPC CIDR of 10.0.0.0/20
The total possible IP addresses for this CIDR Block is 4096
Starting IP address range is 10.0.0.0/20 and the ending 
IP address range is 10.0.15.255

## How many IP addresses to be assigned to each subnet
I have decided to assign 16 IPs to each subnet which is 
means that I will have to used /28 as the Host ID.
This is worked out as 32bits-28bits = 4bits which implies 
2 raised to power of 4bits = 16IPs

Valid subnet IDs in this case will range from 10.0.0.0/28 to 10.0.14.0/28

