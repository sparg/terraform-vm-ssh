output "network_interface_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.tf-vm-tg.id
}