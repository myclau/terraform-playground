

resource "azurerm_virtual_network" "vnet" {
  name                = "vpc${var.vpcNumber}-${azurerm_resource_group.rg.name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  address_space       = ["10.${var.vpcNumber}.0.0/16"]

  subnet {
    name           = "Public-${var.vpcNumber}-1"
    address_prefix = "10.${var.vpcNumber}.1.0/24"
    security_group = "${azurerm_network_security_group.nsg1.id}"
  }

  subnet {
    name           = "Private-${var.vpcNumber}-2"
    address_prefix = "10.${var.vpcNumber}.2.0/24"
    security_group = "${azurerm_network_security_group.nsg2.id}"
  }
  tags = {
    environment = "${var.environment}"
    owner = "${var.owner}"
  }
  depends_on = [azurerm_network_security_group.nsg1,azurerm_network_security_group.nsg2]
}
#share vnet

data "azurerm_virtual_network" "ShareVNet" {
  name                = "vpcxx-shared-service"
  resource_group_name = "share-resource-resourcegroup-name"
}
