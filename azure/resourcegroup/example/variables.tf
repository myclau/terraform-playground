#tag variable
variable "environment" {
  type        = "string"
  description = "environment"
  default = "Production"
}
variable "owner" {
  type        = "string"
  description = "owner name"
  default = "myclau"
}
variable "resourceGroupName" {
  type        = "string"
  description = "The name of resource group"
  default = "CreateFromTerraform"
}

variable "location" {
  type        = "string"
  description = "Location"
  default = "XXXXXXXX"
}

variable "vpcNumber" {
  type        = "string"
  description = "vpcNumber"
  default = "12"
}


# azure account variable
variable "subscriptionId" {
  type        = "string"
  description = "Subscription id"
  default = "xxxxxxxxxxxxxxxxxxxxx"
}

variable "tenantId" {
  type        = "string"
  description = "Tenant id"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "clientId" {
  type        = "string"
  description = "Client id"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "clientSecret" {
  type        = "string"
  description = "Client secret"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
variable "azureENV" {
  type        = "string"
  description = "azure environemnt [public, usgovernment, german or china] "
  default = "public"
}
