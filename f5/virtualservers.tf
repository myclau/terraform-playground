

resource "bigip_ltm_virtual_server" "http-1" {
  name = "/Common/${var.poolName}-http"
  destination = "${var.destination}"
  port = 80
  #pool = "${bigip_ltm_pool.pool-1.name}"
  ip_protocol = "tcp"
  profiles = ["/Common/http"]
  irules = ["/Common/_sys_https_redirect"]
}


#A Virtual server with separate client and server profiles
 resource "bigip_ltm_virtual_server" "https-1" {
  name = "/Common/${var.poolName}-https"
  destination = "${var.destination}"
  port = 443
  pool = "${bigip_ltm_pool.pool-1.name}"
  ip_protocol = "tcp"
  profiles = ["${bigip_ltm_profile_http.http-insert_xforwarded_for.name}"]
  irules = ["${bigip_ltm_irule.rule.name}"]
  # ${var.poolName}-ssl this is ssl profile and need to be create manually on f5
  client_profiles = ["/Common/${var.poolName}-ssl"]
  source_address_translation = "automap"
  depends_on = [bigip_ltm_irule.rule]
}

