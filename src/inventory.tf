resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl", {
    webservers = length(yandex_compute_instance.web) > 0 ? yandex_compute_instance.web : []
    databases  = yandex_compute_instance.db != null ? yandex_compute_instance.db : {}
    storage    = yandex_compute_instance.storage != null ? yandex_compute_instance.db : {}
  })

  filename = "${abspath(path.module)}/hosts.ini"
}
