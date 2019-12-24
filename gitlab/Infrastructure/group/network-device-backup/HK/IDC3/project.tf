resource "gitlab_project" "project_switchs" {
  name        = "switchs"
  description = "switchs config"

  visibility_level = "${var.visibility_level}"
  namespace_id = "${gitlab_group.group.id}"
}
resource "gitlab_project" "project_routers" {
  name        = "routers"
  description = "routers config"

  visibility_level = "${var.visibility_level}"
  namespace_id = "${gitlab_group.group.id}"
}
resource "gitlab_project" "project_firewalls" {
  name        = "firewalls"
  description = "firewalls config"

  visibility_level = "${var.visibility_level}"
  namespace_id = "${gitlab_group.group.id}"
}