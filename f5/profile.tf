resource "bigip_ltm_profile_http" "http-insert_xforwarded_for"{
    name = "/Common/http-insert_xforwarded_for"
    defaults_from = "/Common/http"
    description = "http with insert_xforwarded_for"
    insert_xforwarded_for = "enabled"
}