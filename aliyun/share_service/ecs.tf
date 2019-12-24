resource "alicloud_instance" "instance" {
  # cn-beijing
  
  security_groups = "${alicloud_security_group.nsg-RemoteAccess.*.id}"

  # series III
  instance_type        = "ecs.e3.small"
  system_disk_category = "cloud_efficiency"
  system_disk_size     = "40"
  image_id             = "ubuntu_140405_64_40G_cloudinit_20161115.vhd"
  instance_name        = "test_connection"
  vswitch_id = "${alicloud_vswitch.vsw-public.id}"
  internet_max_bandwidth_out = 10
}