
data "yandex_compute_image" "my_image" {
    for_each = { for vm in var.vm_param_list : vm.vm_name => vm}
    family = each.value.vm_image
}

data "yandex_vpc_subnet" "default" {
    for_each = { for vm in var.vm_param_list : vm.vm_name => vm}
    name = each.value.vm_net_name
}

resource "yandex_compute_disk" "boot-disk" {
    for_each = { for vm in var.vm_param_list : vm.vm_name => vm}
    name     = "${each.value.vm_name}-boot"
    type     = each.value.disk_type
    zone     = each.value.vm_zone
    size     = each.value.disk_size
    image_id = data.yandex_compute_image.my_image[each.key].id
}

resource "yandex_compute_instance" "vm" {
    for_each = { for vm in var.vm_param_list : vm.vm_name => vm}
    name                      = each.value.vm_name
    allow_stopping_for_update = true
    platform_id               = each.value.vm_platform_id
    zone                      = each.value.vm_zone

    resources {
        cores  = each.value.vm_cpu
        memory = each.value.vm_ram
    }

    boot_disk {
        auto_delete = true
        disk_id     = yandex_compute_disk.boot-disk[each.key].id
    }

    network_interface {
        subnet_id = data.yandex_vpc_subnet.default[each.key].id
        nat       = true
    }

    metadata = {
        user-data = "${file("meta.txt")}"
    }
}