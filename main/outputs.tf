############################################
#           MODULE OUTPUT                  #
############################################
output "vpc_id"{
    value="${module.my_vpc.vpc_id}"
}

output "main-public-1_subnet_id" {
  value = "${module.my_vpc.main-public-1_subnet_id}"
}

output "main-private-1_subnet_id" {
  value = "${module.my_vpc.main-private-1_subnet_id}"
}

output "vpc_security_group_ids" {
  value = "${module.my_vpc.vpc_security_group_ids}"
}

output "main-gw_id_id" {
  value = "${module.my_vpc.main-gw_id_id}"
}

output "main-public_route_table_id" {
  value = "${module.my_vpc.main-public_route_table_id}"
}

output "main-public_route_table_association_id" {
  value = "${module.my_vpc.main-public_route_table_association_id}"
}