
variable "vm_param_list" {
    description = "Список параметров для развертывания VM"
    type    = list(object({
        vm_name         = string
        vm_image        = string
        vm_platform_id  = string
        vm_net_name     = string
        vm_zone         = string
        vm_cpu          = number
        vm_ram          = number
        disk_type       = string
        disk_size       = number
    }))
}