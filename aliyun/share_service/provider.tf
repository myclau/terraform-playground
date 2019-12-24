# Configure the Azure Provider
provider "alicloud" {
  version = "=1.50.0"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}