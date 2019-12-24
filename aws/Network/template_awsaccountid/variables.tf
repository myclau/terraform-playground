#tag variable
variable "region" {
  type        = "string"
  description = "Target Region"
  default = "ap-southeast-1"
}
variable "access_key" {
  type        = "string"
  description = "access key"
  default = "---------------"
}
variable "secret_key" {
  type        = "string"
  description = "secret key"
  default = "-----------------------"
}

