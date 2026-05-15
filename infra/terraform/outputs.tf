output "web_url" {
  description = "Web application URL"

  value = "http://localhost:${var.web_external_port}"
}

output "network_name" {
  description = "Docker network name"

  value = module.network.network_name
}

output "web_container" {
  description = "Web container name"

  value = local.web_container_name
}

output "nginx_container_name" {
  value = "nginx-proxy"
}

output "webapp_container_name" {
  value = "dev-frost-webapp"
}

output "docker_network_name" {
  value = "dev_lab_net"
}
