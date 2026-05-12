# Общая сеть для сервисов
resource "docker_network" "lab" {
  name = var.network_name
}

# Web-приложение из GHCR
resource "docker_image" "web" {
  name = var.web_image
}

resource "docker_container" "web" {
  name  = var.web_container_name
  image = docker_image.web.name

  networks_advanced {
    name = docker_network.lab.name
  }

  ports {
    internal = 5000
    external = var.web_external_port
  }

  restart = "unless-stopped"
  env     = ["APP_ENV=prod"]
}

# Redis как пример доп. сервиса
resource "docker_image" "redis" {
  name = var.redis_image
}

resource "docker_container" "redis" {
  name  = var.redis_container_name
  image = docker_image.redis.name

  networks_advanced {
    name = docker_network.lab.name
  }

  restart = "unless-stopped"
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
    command     = "ansible-playbook -i inventory.ini site.yml --extra-vars 'lab_net=${var.network_name} web_container_name=${var.web_container_name}'"
  }

  # Явно говорим: сначала должны существовать контейнеры
  depends_on = [
    docker_container.web,
    docker_container.redis
  ]
}

