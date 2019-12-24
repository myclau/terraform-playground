resource "alicloud_security_group" "nsg-RemoteAccess" {
  name   = "RemoteAccess-${var.group_name}"
  vpc_id = "${alicloud_vpc.vpc.id}"
}

resource "alicloud_security_group_rule" "allow_xxxx_22" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = "${alicloud_security_group.nsg-RemoteAccess.id}"
  cidr_ip           = "xx.xx.xx.xx/32"
}
resource "alicloud_security_group_rule" "allow_xxxx_3389" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "3389/3389"
  priority          = 1
  security_group_id = "${alicloud_security_group.nsg-RemoteAccess.id}"
  cidr_ip           = "xx.xx.xx.xx/32"
}



#--------------------------------

resource "alicloud_security_group" "nsg-PublicToPrivate" {
  name   = "PublicToPrivate-${var.group_name}"
  vpc_id = "${alicloud_vpc.vpc.id}"
}

resource "alicloud_security_group_rule" "allow_all_public" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "1/65535"
  priority          = 1
  security_group_id = "${alicloud_security_group.nsg-PublicToPrivate.id}"
  cidr_ip           = "10.${var.VPC_number}.1.0/24"
}
