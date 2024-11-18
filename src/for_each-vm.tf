resource "yandex_compute_instance" "db" {
  for_each = { for vm in local.vm_configs : vm.vm_name => vm }

  name = each.value.vm_name
  zone = each.value.zone

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id = var.db_image_id
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = true
    security_group_ids = var.security_group_ids
  }

  metadata = {
    ssh-keys  = "lamos:${local.ssh_public_key}"
    user-data = "${file("cloud-init.yaml")}"
  }
}
