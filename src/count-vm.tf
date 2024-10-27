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
      image_id = "fd8qfp90a5l0m3d2htrm"
    }
  }

  network_interface {
    subnet_id = "e9bi11del4gshgcmh476"
    nat = true
  }
  
  scheduling_policy {
    preemptible = true  # Указывает, что ВМ может быть прерываемой
  }
  
  metadata = {
    "ssh-keys" = "lamos:${file("/root/.ssh/id_ed25519.pub")}"
  }

}

