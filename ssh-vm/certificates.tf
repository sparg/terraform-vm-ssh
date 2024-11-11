module "certificates" {
  source    = "../modules/certificates"
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}