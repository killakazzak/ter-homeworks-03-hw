resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.ini"
  content = templatefile("${path.module}/inventory_template.j2", {
    instance_count   = var.instance_count
    web_instances    = yandex_compute_instance.web
    db_instances     = yandex_compute_instance.db
    storage_instance = yandex_compute_instance.storage
  })
}
