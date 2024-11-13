resource "yandex_compute_disk" "my_disk" {
  count = 3

  name   = "disk-${count.index}"
  size   = 1  # размер в Гб
  zone   = "ru-central1-a" 
  type   = "network-ssd" 
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  zone        = "ru-central1-a" 

  resources {
    cores  = 2
    memory = 2  # размер памяти в Гб
  }

  boot_disk {
    initialize_params {
      image_id = "fd8midk9e4fk7jd0ar0j" 
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.my_disk

    content {
      disk_id = secondary_disk.value.id
    }
  }

  network_interface {
    subnet_id = "e9bi11del4gshgcmh476"
    nat      = true
  }
}

