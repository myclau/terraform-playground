resource "bigip_ltm_irule" "rule" {
  name = "/Common/${var.poolName}-irule"
  irule = <<EOF
when HTTP_REQUEST {
 
  #if { [HTTP::host] eq "xxx.subdomain.mydomain.com" } {
  #  pool ${bigip_ltm_pool.pool-1.name}
  #} else {
  #  pool ${bigip_ltm_pool.pool-2.name}
  #}

  # below two already done in http profile (enable insert X-Forwarded-For)
  #HTTP::header insert Host [HTTP::host]
  #HTTP::header insert X-Forwarded-For [IP::remote_addr]
  if {!( [HTTP::header "X-Forwarded-Proto"] eq "https") }{
    HTTP::header insert X-Forwarded-Proto "https"
  }
  if { !( [HTTP::header exists "X-Forwarded-Port"]) }{
    HTTP::header insert X-Forwarded-Port [TCP::local_port]
  }

}
EOF
}