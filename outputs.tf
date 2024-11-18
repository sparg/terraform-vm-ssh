# Public IP address of the VM #
output "public_ip_address" {
  description = "The public IP of VM."
  value       = module.virtual_machine.public_ip_address
}

# Certificates #
output "tls_private_key" {
  description = "The private key."
  value       = module.certificates.private_key
  sensitive   = true
}

output "tls_public_key" {
  description = "The public key."
  value       = module.certificates.public_key
}