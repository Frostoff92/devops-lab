locals {
  prefix = var.environment

  network_name = "${local.prefix}_lab_net"

  web_container_name = "${local.prefix}-frost-webapp"

  redis_container_name = "${local.prefix}-redis"
}
