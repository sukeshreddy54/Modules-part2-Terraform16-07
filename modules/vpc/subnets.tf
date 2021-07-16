resource "aws_subnet" "publicsubnets" {
    count = "${length(var.public_subnets)}"
    vpc_id = "${aws_vpc.default.id}"
    availability_zone = "${element(var.azs,count.index)}"
    cidr_block = "${element(var.public_subnets,count.index)}"
    tags = {
        Name = "${var.vpc_name}-public_subnets_${count.index+1}"
    }
}

resource "aws_subnet" "privatesubnets" {
    count = "${length(var.private_subnets)}"
    vpc_id = "${aws_vpc.default.id}"
    availability_zone = "${element(var.azs,count.index)}"
    cidr_block = "${element(var.private_subnets,count.index)}"
    tags = {
        Name = "${var.vpc_name}-private_subnets_${count.index+1}"
    }
}