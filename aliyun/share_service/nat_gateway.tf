resource "alicloud_nat_gateway" "nat_gateway" {
    vpc_id = "${alicloud_vpc.vpc.id}"
    name = "VPC${var.VPC_number}-nat"
    depends_on        = [alicloud_vpc.vpc]
}