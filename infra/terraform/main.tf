# Общая сеть для сервисов
resource "docker_network" "lab" {
  name = "lab_net"
}

# Web-приложение из GHCR
resource "docker_image" "web" {
  name = "ghcr.io/frostoff92/frost-webapp:latest"
}

resource "docker_container" "web" {
  name  = "frost-webapp"
  image = docker_image.web.name

  networks_advanced {
    name = docker_network.lab.name
  }

  ports {
    internal = 5000
    external = 5000
  }

  restart = "unless-stopped"
  env     = ["APP_ENV=prod"]
}

# Redis как пример доп. сервиса
resource "docker_image" "redis" {
  name = "redis:7-alpine"
}

resource "docker_container" "redis" {
  name  = "lab-redis"
  image = docker_image.redis.name

  networks_advanced {
    name = docker_network.lab.name
  }

  restart = "unless-stopped"
}

output "web_url" {
  value = "http://localhost:5000"
}
