resource "gitlab_group" "group" {
  name              = "${var.group_name}"
  path              = "${var.group_name}"
  description       = "${var.group_description}"
  visibility_level  = "${var.visibility_level}"
  parent_id         = "${var.parent_group_id}"
}