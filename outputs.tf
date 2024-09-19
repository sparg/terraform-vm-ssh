# Public IP address of the VM
output "public_ip_address" {
  description = "The public IP address to access the VM."
  value       = azurerm_public_ip.tf-vm-tg.ip_address
}
