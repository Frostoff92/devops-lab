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

resource "null_resource" "ansible_nginx_proxy" {
  # Если меняется образ, сеть или контейнеры – считаем, что нужно
  # переоткатить nginx-плейбук
  triggers = {
    web_image_id   = docker_image.web.image_id
    redis_image_id = docker_image.redis.image_id
    network_id     = docker_network.lab.id
  }

  provisioner "local-exec" {
    # Переходим в каталог ansible
    working_dir = "${path.module}/../ansible"
    command     = "ansible-playbook -i inventory.ini site.yml"
  }

  # Явно говорим: сначала должны существовать контейнеры
  depends_on = [
    docker_container.web,
    docker_container.redis
  ]
}

