

resource "bigip_ltm_node" "node1" {
  name = "/Common/node1"
  address = "192.168.1.101"
  connection_limit = "0"
  dynamic_ratio = "1"
  monitor = "default"
  rate_limit = "disabled"
  fqdn {
    address_family = "ipv4"
    interval = "3000"
  }
}

resource "bigip_ltm_node" "node2" {
  name = "/Common/node2"
  address = "192.168.1.102"
  connection_limit = "0"
  dynamic_ratio = "1"
  monitor = "default"
  rate_limit = "disabled"
  fqdn {
    address_family = "ipv4"
    interval = "3000"
  }
}

