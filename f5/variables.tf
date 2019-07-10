#tag variable
variable "url" {
  type        = "string"
  description = "Url of f5"
  default = "https://myf5.com"
}
variable "username" {
  type        = "string"
  description = "admin user"
  default = "admin"
}
variable "password" {
  type        = "string"
  description = "admin password"
  default = "admin"
}
variable "poolName" {
  type        = "string"
  description = "pool name"
  default = "pocF5"
}
variable "destination" {
  type        = "string"
  description = "ipaddress for the loadbalancer"
  default = "192.168.x.x"
}
