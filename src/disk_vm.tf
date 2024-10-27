resource "yandex_compute_disk" "my_disk" {
  count = 3

  name   = "disk-${count.index}"
  size   = 1  # размер в Гб
  zone   = "ru-central1-a"  # укажите нужную зону
  type   = "network-ssd"  # тип диска, можно изменить на нужный
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  zone        = "ru-central1-a"  # укажите нужную зону
  platform_id = "standard-v1"  # укажите нужную платформу

  resources {
    cores  = 2
    memory = 2  # размер памяти в Гб
  }

  boot_disk {
    initialize_params {
      image_id = "fd8g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0g0"  # замените на ID вашего образа
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.my_disk

    content {
      disk_id = secondary_disk.value.id
    }
  }

  network_interface {
    subnet_id = "YOUR_SUBNET_ID"  # замените на ID вашей подсети
    nat      = true
  }
}
