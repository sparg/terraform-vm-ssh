# algorithm
variable "algorithm" {
  description = "The algorithm used for generating the private key and the certificate"
  type        = string
}

variable "rsa_bits" {
  description = "The number of bits used in the RSA algorithm"
  type        = number
}