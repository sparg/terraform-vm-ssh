# Public IP address of the VM
output "public_ip_address" {
  description = "The public IP address to access the VM."
  value       = azurerm_public_ip.tf-vm-tg.ip_address
}

# TLS Certificate
output "certificate" {
  value = tls_self_signed_cert.tf-vm-tg.cert_pem
}

# Private Key
output "private_key" {
  value     = tls_private_key.tf-vm-tg.private_key_pem
  sensitive = true
}