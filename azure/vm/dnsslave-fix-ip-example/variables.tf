#tag variable
variable "environment" {
  type        = "string"
  description = "environment"
  default = "Production"
}
variable "prefix" {
  type        = "string"
  description = "vm prefix"
  default = "dnsslave"
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
  default = "xxxxx"
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
  default = "public"
}

variable "os_type" {
  type        = "string"
  description = "Possible values are Linux and Windows"
  default = "Linux"
}
