#tag variable
variable "environment" {
  type        = "string"
  description = "environment"
  default = "Production"
}
variable "prefix" {
  type        = "string"
  description = "vm prefix"
  default = "arachni"
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
  default = "xxxx"
}


# azure account variable
variable "subscriptionId" {
  type        = "string"
  description = "Subscription id"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "tenantId" {
  type        = "string"
  description = "Tenant id"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "clientId" {
  type        = "string"
  description = "Client id"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "clientSecret" {
  type        = "string"
  description = "Client secret"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
variable "azureENV" {
  type        = "string"
  description = "azure environemnt [public, usgovernment, german or china] "
  default = "public"
}
variable "repository_name" {
  type        = "string"
  description = "docker repository"
  default = "arachni"
}
variable "appname" {
  type        = "string"
  description = "docker image name"
  default = "arachni"
}
variable "appversion" {
  type        = "string"
  description = "docker image version"
  default = "1.5.1"
}

variable "os_type" {
  type        = "string"
  description = "Possible values are Linux and Windows"
  default = "Linux"
}
