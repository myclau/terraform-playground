resource "alicloud_vswitch" "vsw-public" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  cidr_block        = "10.${var.VPC_number}.1.0/24"
  availability_zone = "cn-beijing-a"
  name              = "${var.group_name}-Public"
  depends_on        = [alicloud_vpc.vpc]
}
resource "alicloud_vswitch" "vsw2-private" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  cidr_block        = "10.${var.VPC_number}.2.0/24"
  availability_zone = "cn-beijing-a"
  name              = "${var.group_name}-Private"
  depends_on        = [alicloud_vpc.vpc]
}