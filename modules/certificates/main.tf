# Create TLS
resource "tls_private_key" "tf-vm-tg" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "tls_self_signed_cert" "tf-vm-tg" {
  subject {
    common_name  = "tf-vm-tg.com"
    organization = "tf-vm-tg Co"
  }

  validity_period_hours = var.validity_period_hours
  dns_names             = ["tf-vm-tg.com"]
  # key_algorithm         = var.key_algorithm
  private_key_pem = tls_private_key.tf-vm-tg.private_key_pem

  allowed_uses = ["key_encipherment", "digital_signature", "server_auth"]
  # The `allowed_uses` parameter specifies the intended purposes for the self-signed certificate.
  # key_encipherment: Allows the use of the certificate for encrypting keys.
  # digital_signature: Permits the certificate to be used for creating digital signatures.
  # server_auth: Enables the certificate to be used for server authentication.
}