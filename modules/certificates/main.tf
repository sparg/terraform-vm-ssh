# Create TLS
resource "tls_private_key" "tf-vm-tg" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}