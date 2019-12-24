resource "aws_ec2_transit_gateway" "TGW-xxx" {
  description = "Transit gateway"
  auto_accept_shared_attachments = "disable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support = "disable"
  tags = {
    Name = "TGW-xxx"
  }
  vpn_ecmp_support  = "enable"
}