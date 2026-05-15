resource "local_file" "ansible_group_vars" {
  filename = "${path.module}/../ansible/inventory/dev/group_vars/web.yml"

  content = <<-EOF
  lab_net: ${module.network.network_name}

  nginx_external_port: 8080
  nginx_container_name: nginx-proxy
  nginx_image: nginx:alpine

  conf_dir: /opt/nginx-proxy

  nginx_port: 80
  environment_name: dev

  proxy_pass_target: http://webapp
  EOF
}
