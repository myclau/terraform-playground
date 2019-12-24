module "network-device-backup" {
  source                    = "./group/network-device-backup"
  parent_group_id    = "${gitlab_group.group.id}"
}