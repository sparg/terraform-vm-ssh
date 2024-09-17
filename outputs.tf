# Dirección IP pública de la VM
output "public_ip_address" {
  description = "La dirección IP pública para acceder a la VM."
  value       = azurerm_public_ip.tf-vm-tg.ip_address
}
