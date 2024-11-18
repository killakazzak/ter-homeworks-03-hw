resource "yandex_compute_disk" "my_disk" {
  count = var.disk_count

  name = "disk-${count.index}"
  size = var.disk_size # размер в Гб
  zone = var.disk_zone
  type = var.disk_type
}

resource "yandex_compute_instance" "storage" {
  name = var.instance_name
  zone = var.instance_zone

  resources {
    cores  = var.instance_cores
    memory = var.instance_memory # размер памяти в Гб
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.my_disk

    content {
      disk_id = secondary_disk.value.id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
}
