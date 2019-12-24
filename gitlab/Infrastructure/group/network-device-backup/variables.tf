
variable "group_name" {
  type        = "string"
  description = "group_name"
  default = "network-device-backup"
}

variable "group_description" {
  type        = "string"
  description = "group_description"
  default = "network device backup"
}
variable "visibility_level" {
  type        = "string"
  description = "visibility_level"
  default = "private"
}

variable "parent_group_id" {
  type        = "string"
  description = "parent_group_id"

}