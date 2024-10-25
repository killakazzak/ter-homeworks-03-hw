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
