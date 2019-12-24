resource "gitlab_project" "project_docker" {
  name        = "docker-image"
  description = "docker-image of oxidized"

  visibility_level = "${var.visibility_level}"
  namespace_id = "${gitlab_group.group.id}"
}
