resource "yandex_compute_instance" "web" {
  count = var.instance_count

  name = "web-${count.index + 1}" # Создаст web-1 и web-2
  zone = var.zone

  resources {
    core_fraction = var.core_fraction
    cores         = var.cores
    memory        = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = true
    security_group_ids = var.security_group_ids
  }

  scheduling_policy {
    preemptible = true # Указывает, что ВМ может быть прерываемой
  }

  metadata = {
    ssh-keys  = "lamos:${local.ssh_public_key}"
    user-data = "${file("cloud-init.yaml")}"
  }

  depends_on = [yandex_compute_instance.db] # Зависимость от ВМ db
}
