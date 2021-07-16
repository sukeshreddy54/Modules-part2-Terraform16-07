#output testvpcid {
#  value       = "${module.devopsb16-testvpc.vpcid}"
#}
#
#output prodvpcid {
#  value       = "module.devopsb16-prodvpc.vpcid"
#}
output all_public_subnets {
  value       = "${module.devopsb16-testvpc.all_public_subnets}"
}

output all_private_subnets {
  value       = "${module.devopsb16-testvpc.all_private_subnets}"
}

output publicsubnet_1 {
  value       = "${module.devopsb16-testvpc.subnet1id}"
}

output publicsubnet_2 {
  value       = "${module.devopsb16-testvpc.subnet2id}"
}

output publicsubnet3 {
  value       = "${module.devopsb16-testvpc.subnet3id}"
}

output env {
  value       = "${module.devopsb16-testvpc.env}"
}

output vpcname {
  value       = "${module.devopsb16-testvpc.vpcname}"
}

