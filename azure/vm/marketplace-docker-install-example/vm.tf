resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"

  ip_configuration {
    name                          = "ipconfiguration1"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    owner = "${var.owner}"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.prefix}-vm"
  location              = "${data.azurerm_resource_group.rg.location}"
  resource_group_name   = "${data.azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]
  vm_size               = "Standard_A1"
  depends_on           = ["azurerm_network_interface.nic","azurerm_storage_container.sa-container"]
  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name          = "${var.prefix}-osdisk"
    #image_uri     = "${var.source_img_uri}"
    vhd_uri       = "https://${azurerm_storage_account.sa.name}.blob.core.chinacloudapi.cn/vhds/${var.prefix}-osdisk.vhd"
    os_type       = "${var.os_type}"
    caching       = "ReadWrite"
    create_option = "FromImage"
    disk_size_gb ="30"
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
  os_type              = "linux"

  script = <<EOF
apt-get update 
apt-get upgrade 
apt-get -y install openssh-server 
apt-get -y install apt-transport-https ca-certificates curl software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - 
add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable\" 
apt-get upgrade
apt-get -y install docker.io 
usermod -aG docker $(whoami)
docker login -u xxxxxxxxxxxx -p xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx xxxxxxx.azurecr.cn
docker run -d -p 80:80 --restart always ${var.repository_name}/${var.appname}:${var.appversion}

EOF
}