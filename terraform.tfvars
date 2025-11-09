vm_param_list = [ 
    # Vm-1
    {
        vm_name         = "vm-test-1"
        vm_image        = "ubuntu-2204-lts"
        vm_platform_id  = "standard-v3"
        vm_net_name     = "default-ru-central1-b"
        vm_zone         = "ru-central1-b"
        vm_cpu          = 2
        vm_ram          = 2
        // Параметры диска ВМ
        disk_type       = "network-hdd"
        disk_size       = 20
    },
     # Vm-2
    {
        vm_name         = "vm-test-2"
        vm_image        = "ubuntu-2204-lts"
        vm_platform_id  = "standard-v3"
        vm_net_name     = "default-ru-central1-b"
        vm_zone         = "ru-central1-b"
        vm_cpu          = 2
        vm_ram          = 2
        // Параметры диска ВМ
        disk_type       = "network-hdd"
        disk_size       = 20
    }
]
