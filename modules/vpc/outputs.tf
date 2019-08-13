############################################
#           VPC RESOURCE OUTPUT            #
############################################
output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "main-public-1_subnet_id" {
  value = "${aws_subnet.main-public-1.id}"
}

output "main-private-1_subnet_id" {
  value = "${aws_subnet.main-private-1.id}"
}

output "vpc_security_group_ids" {
  value = "${aws_security_group.nat.id}"
}

output "main-gw_id_id" {
  value = "${aws_internet_gateway.main-gw.id}"
}

output "main-public_route_table_id" {
  value = "${aws_route_table.main-public.id}"
}

output "main-public_route_table_association_id" {
  value = "${aws_route_table_association.main-public-1-a.id}"
}