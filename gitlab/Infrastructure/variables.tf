#tag variable
variable "gitlab_token" {
  type        = "string"
  description = "gitlab_token"
  default = "xxxxxxxxxxxx"
}
variable "base_url" {
  type        = "string"
  description = "base_url"
  default = "https://gitlab.xxx.com"
}
variable "group_name" {
  type        = "string"
  description = "group_name"
  default = "Infrastructure"
}
variable "group_description" {
  type        = "string"
  description = "group_description"
  default = "Group using for oxidized in Infrastructure team (test nested terraform script)"
}
variable "visibility_level" {
  type        = "string"
  description = "visibility_level"
  default = "private"
}

