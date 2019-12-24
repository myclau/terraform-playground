module "oxidized" {
  source                    = "./oxidized"
  parent_group_id    = "${gitlab_group.group.id}"
}

module "HK" {
  source                    = "./HK"
  parent_group_id    = "${gitlab_group.group.id}"
}