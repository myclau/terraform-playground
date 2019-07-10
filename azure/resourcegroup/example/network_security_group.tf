

resource "azurerm_network_security_group" "nsg1" {
  name                = "RemoteAccess"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  
  
  security_rule {
        name                       = "AllowRemoteAccessFromOffice01"
        priority                   = 103
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = ["22","3389"]
        source_address_prefix      = "xx.xx.xx.xx/xx"
        destination_address_prefix = "*"
  }
  

  tags = {
    environment = "${var.environment}"
    owner = "${var.owner}"
  }
}




resource "azurerm_network_security_group" "nsg2" {
  name                = "PublicToPrivate"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  security_rule {
        name                       = "AllowAccessFromPublicSubnet"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.${var.vpcNumber}.1.0/24"
        destination_address_prefix = "*"
  }
  
  tags = {
    environment = "${var.environment}"
    owner = "${var.owner}"
  }
}
