

resource "azurerm_virtual_network_peering" "peering1" {
  name                      = "vpc40-vpc${var.vpcNumber}"
  resource_group_name       = "${data.azurerm_virtual_network.ShareVNet.resource_group_name}"
  virtual_network_name      = "${data.azurerm_virtual_network.ShareVNet.name}"
  remote_virtual_network_id = "${azurerm_virtual_network.vnet.id}"
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = true
  depends_on = [data.azurerm_virtual_network.ShareVNet,azurerm_virtual_network.vnet]
}

resource "azurerm_virtual_network_peering" "peering2" {
  name                      = "vpc${var.vpcNumber}-vpc40"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  virtual_network_name      = "${azurerm_virtual_network.vnet.name}"
  remote_virtual_network_id = "${data.azurerm_virtual_network.ShareVNet.id}"
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  use_remote_gateways = true
  depends_on = [data.azurerm_virtual_network.ShareVNet,azurerm_virtual_network.vnet]
}