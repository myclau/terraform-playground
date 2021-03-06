resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  #network_security_group_id = "${azurerm_network_security_group.nsg.id}"

  ip_configuration {
    name                          = "ipconfiguration1"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address            = "10.xx.2.174"
    private_ip_address_allocation = "Static"
    #public_ip_address_id          = "${azurerm_public_ip.public-ip.id}"
    
  }
  tags = {
    owner = "${var.owner}"
  }
}


#resource "azurerm_managed_disk" "os-disk" {
#  name                 = "${var.prefix}-osdisk"
#  location             = "${data.azurerm_resource_group.rg.location}"
#  resource_group_name  = "${data.azurerm_resource_group.rg.name}"
#  storage_account_type = "Standard_LRS"
#  create_option        = "Empty"
#  disk_size_gb         = "50"
#
#  tags = {
#    owner = "${var.owner}"
#  }
#}

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.prefix}-vm"
  location              = "${data.azurerm_resource_group.rg.location}"
  resource_group_name   = "${data.azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]
  vm_size               = "Standard_A2"
  depends_on           = ["azurerm_network_interface.nic"]
  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.prefix}-vm"
    admin_username = "sysadmin"
    admin_password = "passssssword"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    owner = "${var.owner}"
  }
}

module "run_command" {
  source               = "innovationnorway/vm-run-command/azurerm"
  resource_group_name  = "${data.azurerm_resource_group.rg.name}"
  virtual_machine_name = "${azurerm_virtual_machine.vm.name}"
  os_type              = "${var.os_type}"

  script = <<EOF
apt-get update 
apt-get upgrade 
apt-get install -y bind9
EOF
}

output "ip" {
  value = azurerm_network_interface.nic.private_ip_address
}