#tag variable
variable "region" {
  type        = "string"
  description = "Target Region"
  default = "ap-southeast-1"
}
variable "access_key" {
  type        = "string"
  description = "access key"
  default = "xxxxxxxxxxxxxxxxxxxx"
}
variable "secret_key" {
  type        = "string"
  description = "secret key"
  default = "xxxxxxxxxxxxxxxxxxxxxx"
}
variable "vm_name" {
  type        = "string"
  description = "vm name"
  default = "DNSSLAVE"
}


variable "ami_id" {
  type        = "string"
  description = "ami id"
  default = "ami-01f7527546b557442"
}
variable "key_name" {
  type        = "string"
  description = "key pair name"
  default = "aws-global-hk"
}
