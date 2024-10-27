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
      image_id = "fd8ad8j9gqqntstk5c36"
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id = "e9bi11del4gshgcmh476"
    nat = true
    security_group_ids = ["enpgkfejf10nncf6u3p1"]
  }
  
  metadata = {
    ssh-keys = "lamos:${local.ssh_public_key}"
    user-data = "${file("cloud-init.yaml")}"
  }
}
