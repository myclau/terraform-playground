

resource "azurerm_storage_account" "sa" {
  name                     = "marketplacesa"
  resource_group_name      = "${data.azurerm_resource_group.rg.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  account_kind = "StorageV2"
  tags = {
    owner = "${var.owner}"
  }
}

resource "azurerm_storage_container" "sa-container" {
  name                  = "vhds"
  resource_group_name   = "${data.azurerm_resource_group.rg.name}"
  storage_account_name  = "${azurerm_storage_account.sa.name}"
  container_access_type = "private"
  depends_on           = ["azurerm_storage_account.sa"]
}

