# Configure the Azure Provider
provider "gitlab" {
  token = "${var.gitlab_token}"
  base_url = "${var.base_url}"
}