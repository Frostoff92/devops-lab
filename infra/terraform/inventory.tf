resource "local_file" "ansible_inventory_dev" {
  filename = "${path.module}/../ansible/inventory/dev/hosts.ini"

  content = <<-EOF
  [web]
  localhost ansible_connection=local
  EOF
}
