# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.30.1"
  subscription_id = "${var.subscriptionId}"
  tenant_id       = "${var.tenantId}"
  client_id       = "${var.clientId}"
  client_secret   = "${var.clientSecret}"
  environment = "${var.azureENV}"
}