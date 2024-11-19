resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

output "vm_list" {
  value = concat(
    [
      for i in range(var.instance_count) : {
        name = "web-${i + 1}"
        id   = yandex_compute_instance.web[i].id
        fqdn = "${yandex_compute_instance.web[i].id}.auto.internal"
      }
    ],
    [
      for instance in yandex_compute_instance.db : {
        name = instance.name
        id   = instance.id
        fqdn = "${instance.id}.auto.internal"
      }
    ],
    [
      {
        name = yandex_compute_instance.storage.name
        id   = yandex_compute_instance.storage.id
        fqdn = "${yandex_compute_instance.storage.id}.auto.internal"
      }
    ]
  )
}




