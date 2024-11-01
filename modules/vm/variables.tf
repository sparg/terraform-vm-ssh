variable "resource_group_name" {
  description = "resource_group_name"
  type        = string
}

variable "location" {
  description = "location"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the virtual machine."
  type        = string
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

variable "computer_name" {
  description = "computer name"
  type        = string
}

# ssh_key #
variable "public_ssh_key" {
  description = "The SSH public key for VM access."
  type        = string
}

# tags #
variable "environment" {
  description = "Tag to specify the environment (production, development, etc.)."
  type        = string
}

variable "subnet_id" {
  description = "The subnet id."
  type        = string
}

variable "instance" {
  description = "The instance of resource."
  type        = string
}