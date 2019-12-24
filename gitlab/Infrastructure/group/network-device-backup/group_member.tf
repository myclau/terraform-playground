resource "gitlab_group_membership" "member-oxidized" {
    group_id        = "${gitlab_group.group.id}"
    user_id         = "${data.gitlab_user.user_oxidized.id}"
    access_level    = "master"
}
data "gitlab_user" "user_oxidized" {
  username = "oxidized"
}