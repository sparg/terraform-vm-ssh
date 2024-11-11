# ##########  Global  ##########
variable "instance" {
  description = "The instance of resource."
  type        = string
}

variable "environment" {
  description = "Tag to specify the environment (production, development, etc.)."
  type        = string
  default     = "testing"
}
# ########### ########### ###########

# ##########  Virtual Machine  ##########
variable "location" {
  description = "Azure location where the virtual machine will be deployed."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "vm-linux"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "computer_name" {
  description = "The computer name of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the virtual machine."
  type        = string
  sensitive   = true # Marks the password as sensitive
}

# source image #
variable "image_publisher" {
  description = "Publisher of the image"
  type        = string
}

variable "image_offer" {
  description = "Offer of the image"
  type        = string
}

variable "image_sku" {
  description = "SKU of the image"
  type        = string
}

variable "image_version" {
  description = "Version of the image"
  type        = string
}
# ########### ########### ###########

# ##########  NETWORKING  ##########
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "address_space" {
  description = "The IP address range for the virtual network."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The IP address prefix for the subnet."
  type        = string
}
# ########### ########### ###########

# ##########  algorithm  ##########
variable "algorithm" {
  description = "The algorithm used for generating the private key and the certificate"
  type        = string
}

variable "rsa_bits" {
  description = "The number of bits used in the RSA algorithm"
  type        = number
}
# ########### ########### ###########

# public only for public IP address #
variable "public_ip_address" {
  description = "The public IP address allowed to access the VM via SSH"
  type        = string
}