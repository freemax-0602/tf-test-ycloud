
data "yandex_compute_image" "my_image" {
  family = var.vm-image
}

data "yandex_vpc_subnet" "default" {
  name = var.vm-net-name
}

resource "yandex_compute_disk" "boot-disk" {
  name     = var.disk-name
  type     = var.disk-type
  zone     = var.vm-zone
  size     = var.disk-size
  image_id = data.yandex_compute_image.my_image.id
}

resource "yandex_compute_instance" "vm-1" {
  name                      = var.vm-name
  allow_stopping_for_update = true
  platform_id               = var.vm-platform_id
  zone                      = var.vm-zone

  resources {
    cores  = var.vm-cpu
    memory = var.vm-ram
  }

  boot_disk {
    auto_delete = true
    disk_id     = yandex_compute_disk.boot-disk.id
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.default.id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

output "public-ip-vm" {
  description = "Публичный IP VM-1"
  value       = yandex_compute_instance.vm-1.network_interface[0].nat_ip_address
}

output "private-ip-vm" {
  description = "Приветный IP VM-1"
  value       = yandex_compute_instance.vm-1.network_interface[0].ip_address
}