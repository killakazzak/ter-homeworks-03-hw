locals {
  vm_configs = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 1
      disk_volume = 100
      zone        = "ru-central1-a"
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 1
      disk_volume = 50
      zone        = "ru-central1-b"
    }
  ]
}

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
      image_id = ""  # Укажите нужный образ
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id = "<your_subnet_id>"  # Укажите ID вашей подсети

    nat = true

    security_group_ids = ["<your_security_group_id>"]  # Укажите ID группы безопасности
  }
}
