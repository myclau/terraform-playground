resource "alicloud_vpc" "vpc" {
  name       = "vpc${var.VPC_number}-${var.group_name}"
  cidr_block = "10.${var.VPC_number}.0.0/16"
  description = "VPC for ${var.group_name}"
}
