### Main ####
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
  type = string
}

variable "admin_username" {
  description = "The administrator username for the virtual machine."
  type        = string
}

variable "environment" {
  description = "Tag to specify the environment (production, development, etc.)."
  type        = string
  default     = "testing"
}

variable "admin_password" {
  description = "The administrator password for the virtual machine."
  type        = string
  sensitive   = true # Marks the password as sensitive
}

# source_image_reference #
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

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The IP address range for the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The IP address prefix for the subnet."
  type        = string
}

variable "network_interface_name" {
  description = "The name of the network interface."
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group."
  type        = string
}

# ########### ########### ###########

# public only for public IP address #
variable "public_ip_address" {
  description = "The public IP address allowed to access the VM via SSH"
  type        = string
}

# SSH KEY
variable "public_ssh_key" {
  description = "The SSH public key for VM access."
  type        = string
}
