output "id" {
  value = azurerm_linux_virtual_machine.tf-vm-tg.id
}

output "public_ip" {
  value = azurerm_public_ip.tf-vm-tg.ip_address
}