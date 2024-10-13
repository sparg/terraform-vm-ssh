# Public IP address of the VM
output "public_ip_address" {
  description = "The public IP address to access the VM."
  value       = azurerm_public_ip.tf-vm-tg.ip_address
}

# TLS Certificate
# output "certificate" {
#   value = tls_self_signed_cert.tf-vm-tg.cert_pem
# }

output "public_ssh_key" {
  value = var.public_ssh_key
}
