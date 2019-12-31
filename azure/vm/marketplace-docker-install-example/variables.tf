#tag variable
variable "environment" {
  type        = "string"
  description = "environment"
  default = "Production"
}
variable "prefix" {
  type        = "string"
  description = "vm prefix"
  default = "marketplace-v1.0.1"
}
variable "owner" {
  type        = "string"
  description = "environment"
  default = "myclau"
}
variable "resourceGroupName" {
  type        = "string"
  description = "The name of resource group"
  default = "Shared-Service"
}

variable "location" {
  type        = "string"
  description = "Location"
  default = "chinaeast2"
}


# azure account variable
variable "subscriptionId" {
  type        = "string"
  description = "Subscription id"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "tenantId" {
  type        = "string"
  description = "Tenant id"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "clientId" {
  type        = "string"
  description = "Client id"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "clientSecret" {
  type        = "string"
  description = "Client secret"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
variable "azureENV" {
  type        = "string"
  description = "azure environemnt [public, usgovernment, german or china] "
  default = "china"
}
variable "repository_name" {
  type        = "string"
  description = "docker repository"
  default = "xxxxxx.azurecr.cn"
}
variable "appname" {
  type        = "string"
  description = "docker image name"
  default = "azure-marketplace-tempapp"
}
variable "appversion" {
  type        = "string"
  description = "docker image version"
  default = "1.0.1"
}
variable "source_img_uri" {
  type        = "string"
  description = "Specifies the Image URI in the format publisherName:offer:skus:version"
  default = "Canonical:UbuntuServer:16.04-LTS:latest"
}
variable "os_type" {
  type        = "string"
  description = "Possible values are Linux and Windows"
  default = "Linux"
}
