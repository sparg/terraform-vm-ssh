variable "location" {
  description = "Azure location where the virtual machine will be deployed."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "rg-linux-vm"
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "vnet-linux"
}

variable "address_space" {
  description = "The IP address range for the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  default     = "subnet-linux"
}

variable "subnet_address_prefix" {
  description = "The IP address prefix for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "network_interface_name" {
  description = "The name of the network interface."
  type        = string
  default     = "nic-linux-vm"
}

variable "nsg_name" {
  description = "The name of the network security group."
  type        = string
  default     = "nsg-linux"
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "vm-linux"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "The administrator username for the virtual machine."
  type        = string
  # default     = "user"
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
  # default     = "password"
}

# source_image_reference #
variable "image_publisher" {
  description = "Publisher of the image"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Offer of the image"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "SKU of the image"
  type        = string
  default     = "22_04-lts-gen2" # Last version in westeurope of ubuntu.
}

variable "image_version" {
  description = "Version of the image"
  type        = string
  default     = "latest"
}

# ##########

# algorithm
variable "algorithm" {
  description = "The algorithm used for generating the private key and the certificate"
  type        = string
  default     = "RSA"
}

variable "rsa_bits" {
  description = "The number of bits used in the RSA algorithm"
  type        = number
  default     = 4096
}

variable "key_algorithm" {
  description = "The key algorithm used for generating the certificate"
  type        = string
  default     = "RSA"
}

variable "validity_period_hours" {
  description = "The validity period of the certificate in hours (default 3 days)"
  type        = number
  default     = 72
}

# ##########

# public only for public IP address #
variable "public_ip_address" {
  description = "The public IP address allowed to access the VM via SSH"
  type        = string
}

# ##########
# Az table storage
# ##########

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
  default     = "tfsttbl2358"
}

variable "account_tier" {
  description = "Standard o Premium"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Type (LRS, GRS, RAGRS, ZRS)."
  type        = string
  default     = "LRS"
}

variable "storage_table_name" {
  description = "Table name."
  type        = string
  default     = "mytabletfvmtg"
}

# ##########