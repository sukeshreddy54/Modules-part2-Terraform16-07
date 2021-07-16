provider "aws" {
    access_key = "AKIATU5ZOAWQ66LHST6R"
    secret_key = "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"
    region = "us-east-1"
}

module devopsb16-testvpc {
  source = "./modules/vpc"
vpc_cidr = "10.120.0.0/16"
vpc_name = "devopsb16-testvpc"
IGW_name = "devopsb16-testigw"
key_name = "awswebservice"
azs = ["us-east-1a", "us-east-1b" , "us-east-1c"]
public_subnets = ["10.120.1.0/24", "10.120.2.0/24", "10.120.3.0/24"]
private_subnets = ["10.120.10.0/24", "10.120.20.0/24", "10.120.30.0/24"]
Main_Routing_Table  = "Main_routing_table"
private_Routing_Table = "private_Routing_Table"
environment  = "prod"
}

module devopsb16-ec2 {
  source = "./modules/ec2"
imagename = "ami-09e67e426f25ce0d7"
instance_type = "t2.micro"
key_name = "awswebservice"
machinecount = "${module.devopsb16-testvpc.env == "prod" ? 3 : 1 }"
sgid = "${module.devopsb16-testvpc.sgid}"
vpcname = "${module.devopsb16-testvpc.vpcname}"
publicsubnets = "${module.devopsb16-testvpc.all_public_subnets}"
}