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

  value = docker_container.web.name
}
