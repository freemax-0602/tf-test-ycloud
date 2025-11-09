output "public_ip_vm" {
  description = "Публичный IP VM"
  value       = yandex_compute_instance.vm-1.network_interface[0].nat_ip_address
}

output "private_ip_vm" {
  description = "Приветный IP VM"
  value       = yandex_compute_instance.vm-1.network_interface[0].ip_address
}