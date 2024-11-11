output "public_key" {
  value     = tls_private_key.tf-vm-tg.public_key_openssh
  sensitive = false
}

output "private_key" {
  value     = tls_private_key.tf-vm-tg.private_key_pem
  sensitive = true
}