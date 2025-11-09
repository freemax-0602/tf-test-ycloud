output "vm_public_ip" {
  value = {
    for k, vm in yandex_compute_instance.vm :
    vm.name => vm.network_interface[0].nat_ip_address
  }
  
}