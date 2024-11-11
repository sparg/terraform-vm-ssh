# virtual network #
variable "address_space" {
  description = "The IP address range for the virtual network."
  type        = string
}

variable "location" {
  description = "location"
  type        = string
}

variable "resource_group_name" {
  description = "resource_group_name"
  type        = string
}

# subnet #
variable "subnet_address_prefix" {
  description = "The IP address prefix for the subnet."
  type        = string
}

# global #
variable "environment" {
  description = "The environment of the storage."
  type        = string
}

variable "instance" {
  description = "The instance of the storage."
  type        = string
}