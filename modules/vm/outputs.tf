output "id" {
  value = azurerm_linux_virtual_machine.tf-vm-tg.id
}

output "network_interface_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.tf-vm-tg.id
}

output "public_ip_address" {
  value = azurerm_public_ip.tf-vm-tg.ip_address
}
