data "azurerm_virtual_network" "vnet" {
  name                = "vpcxx-shared-service"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
}

data "azurerm_subnet" "subnet" {
  name                 = "Private_xx_2"
  resource_group_name  = "${data.azurerm_resource_group.rg.name}"
  virtual_network_name = "${data.azurerm_virtual_network.vnet.name}"
  
}
#resource "azurerm_public_ip" "public-ip" {
#  name                = "${var.prefix}-ip"
#  location            = "${var.location}"
#  resource_group_name = "${azurerm_resource_group.rg.name}"
#  allocation_method   = "Dynamic"
#  domain_name_label   = "mydomain-${var.prefix}"
#
#  tags = {
#    owner = "${var.owner}"
#  }
#}
