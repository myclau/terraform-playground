#tag variable
variable "access_key" {
  type        = "string"
  description = "access_key"
  default = "xxxxxxxxxxxxxxxxxxxxx"
}
variable "secret_key" {
  type        = "string"
  description = "secret_key"
  default = "xxxxxxxxxxxxxxxxxxxx"
}
variable "region" {
  type        = "string"
  description = "region"
  default = "cn-beijing"
}
variable "VPC_number" {
  type        = "string"
  description = "VPC_number"
  default = "36"
}
variable "group_name" {
  type        = "string"
  description = "group_name"
  default = "share_service"
}
