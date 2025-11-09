module "vpc_1" {
    source = "./modules/vpc"
    vm_zone = "ru-central1-b"
    // Параметры диска
    disk_name = ""
    disk_type = "network-hdd"
    disk_size = 20
    // Параметры ВМ
    vm_name = "vm-test-1"
    vm_platform_id = "standard-v3"
    vm_cpu = 2
    vm_ram = 2
}

module "vpc_2" {
    source = "./modules/vpc"
    vm_zone = "ru-central1-b"
    // Параметры диска
    disk_name = ""
    disk_type = "network-hdd"
    disk_size = 25
    // Параметры ВМ
    vm_name = "vm-test-2"
    vm_platform_id = "standard-v3"
    vm_cpu = 2
    vm_ram = 2
}

output "vpc_1_public_ip" {
    value = module.vpc_1.private_ip_vm
}

output "vpc_1_private_ip" {
    value = module.vpc_1.private_ip_vm
}

output "vpc_2_public_ip" {
    value = module.vpc_2.private_ip_vm
}

output "vpc_2_private_ip" {
    value = module.vpc_2.private_ip_vm
}