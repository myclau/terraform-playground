
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.prefix}-nsg"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  security_rule {
        name                       = "portfor${var.prefix}"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_ranges    = ["222","80","7331"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
  }
  
  tags = {
    environment = "${var.environment}"
    owner = "${var.owner}"
  }
}