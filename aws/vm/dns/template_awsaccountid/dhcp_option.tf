resource "aws_vpc_dhcp_options" "dncp" {
  domain_name          = "ap-southeast-1.compute.internal"
  domain_name_servers  = ["${aws_instance.vm.private_ip}"]
  
  tags = {
    Name = "VPC60_PrivateDNS"
  }
  depends_on = [null_resource.bootstrap]
}