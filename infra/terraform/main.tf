# Общая сеть для сервисов
module "network" {
  source = "./modules/network"

  network_name = local.network_name
}

# Web-приложение из GHCR
resource "docker_image" "web" {
  name = var.web_image
}

# resource "docker_container" "web" {
#  name  = local.web_container_name
#  image = docker_image.web.name
#
#  networks_advanced {
#    name = module.network.network_name
#  }
#
#  ports {
#    internal = 5000
#    external = var.web_external_port
#  }
#
#  restart = "unless-stopped"
#  env     = ["APP_ENV=prod"]
#
#  lifecycle {
#    ignore_changes = [
#      env
#   ]
#    create_before_destroy = true
#  }
#}
#

# Redis как пример доп. сервиса
resource "docker_image" "redis" {
  name = var.redis_image
}

resource "docker_container" "redis" {
  name  = local.redis_container_name
  image = docker_image.redis.name

  networks_advanced {
    name = module.network.network_name
  }

  restart = "unless-stopped"
}

resource "null_resource" "ansible_nginx_proxy" {
  # Если меняется образ, сеть или контейнеры – считаем, что нужно
  # переоткатить nginx-плейбук
  triggers = {
    web_image_id   = docker_image.web.image_id
    redis_image_id = docker_image.redis.image_id
    network_id     = module.network.network_id
  }

  provisioner "local-exec" {
    # Переходим в каталог ansible
    working_dir = "${path.module}/../ansible"
    command     = "ansible-playbook -i inventory.ini site.yml --extra-vars 'lab_net=${local.network_name} web_container_name=${local.web_container_name}'"
  }

  # Явно говорим: сначала должны существовать контейнеры
  depends_on = [
    docker_container.redis
  ]
}

