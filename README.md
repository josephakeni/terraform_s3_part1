# terraform_s3_part1

## VPC
VPCs are the base of many services in AWS. Multiple VPCs 
can be created in one region but will not reflect in any other region.

## VPC CIDR (Classles Inter-Domain Routing) Blocks
A primary CIDR block must be assigned when a VPC is created.

## Classles Inter-Domain Routing (CIDR)

<p>Given the VPC CIDR of 10.0.0.0/20<br>
The total possible IP addresses for this CIDR Block is 4096<br>
Starting IP address range is 10.0.0.0/20 and the ending <br>
IP address range is 10.0.15.255</p>

## How many IP addresses to be assigned to each subnet

<p>I have decided to assign 16 IPs to each subnet which is<br> 
means that I will have to used /28 as the Host ID.<br>
This is worked out as 32bits-28bits = 4bits which implies <br>
2 raised to power of 4bits = 16 IPs<br>
However, AWS reserves the first four and last IP in every subnet</p>

Valid subnet IDs in this case will range from 10.0.0.0/28 to 10.0.15.255/28

| Description | Range          | Binary |
| ----------- | -----------    | ----------------------------------- |
| Starting IP | 10.0.0.0/20    | 11111111.11111111.11110000.00000000 |
| Ending IP   | 10.0.15.255/20 | 00000000.00000000.00001111.11111111 |
