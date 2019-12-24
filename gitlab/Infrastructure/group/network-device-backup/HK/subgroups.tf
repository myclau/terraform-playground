module "IDC1" {
  source                    = "./IDC1"
  parent_group_id    = "${gitlab_group.group.id}"
}

module "IDC2" {
  source                    = "./IDC2"
  parent_group_id    = "${gitlab_group.group.id}"
}

module "IDC3" {
  source                    = "./IDC3"
  parent_group_id    = "${gitlab_group.group.id}"
}

