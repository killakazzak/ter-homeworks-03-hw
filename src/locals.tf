locals {
  vm_configs = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 4
      disk_volume = 100
      zone        = "ru-central1-a"
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 4
      disk_volume = 50
      zone        = "ru-central1-a"
    }
  ]
depends_on = [yandex_compute_instance.db]  # Зависимость от ВМ db
}
  ssh_public_key = file("/root/.ssh/id_ed25519.pub")
}

