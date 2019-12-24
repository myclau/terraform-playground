
variable "group_name" {
  type        = "string"
  description = "group_name"
  default = "IDC3"
}

variable "group_description" {
  type        = "string"
  description = "group_description"
  default = "For IDC3"
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
