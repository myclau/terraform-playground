provider "bigip" {
  version = "=0.12.3"
  address = "${var.url}"
  username = "${var.username}"
  password = "${var.password}"
}