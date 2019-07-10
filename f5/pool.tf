
resource "bigip_ltm_pool" "pool-1" {
  name = "/Common/pool-${var.poolName}-rancher"
  load_balancing_mode = "round-robin"
  monitors = ["${bigip_ltm_monitor.monitor.name}"]
  allow_snat = "yes"
  allow_nat = "yes"
}
resource "bigip_ltm_pool_attachment" "attach-node1-to-pool-1" {
  pool = "${bigip_ltm_pool.pool-1.name}"
  node = "${bigip_ltm_node.node1.name}:80"
  depends_on = [bigip_ltm_node.node1]
}
resource "bigip_ltm_pool_attachment" "attach-node2-to-pool-1" {
  pool = "${bigip_ltm_pool.pool-1.name}"
  node = "${bigip_ltm_node.node2.name}:80"
  depends_on = [bigip_ltm_node.node2]
}
