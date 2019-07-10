resource "bigip_ltm_monitor" "monitor" {
  name = "/Common/monitor-worker-node"
  parent = "/Common/http"
  send = "GET /someApiEndpoint HTTP/1.1"
  timeout = "16"
  interval = "5"
}
