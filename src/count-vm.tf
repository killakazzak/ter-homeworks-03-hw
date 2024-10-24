resource "yandex_compute_instance" "web" {
  count = 2

  name = "web-${count.index + 1}"  # Создаст web-1 и web-2
  zone = "ru-central1-a"     

  resources {
    core_fraction = 5
    cores  = 2
    memory = 1
    
  }

  boot_disk {
    initialize_params {
      image_id = "fd8ad8j9gqqntstk5c36"
    }
  }

  network_interface {
    subnet_id = "e9bi11del4gshgcmh476"
    nat = true
    security_group_ids = ["enpgkfejf10nncf6u3p1"]
  }
  
  scheduling_policy {
    preemptible = true  # Указывает, что ВМ может быть прерываемой
  }
}

