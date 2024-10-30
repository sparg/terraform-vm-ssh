# virtual network #
variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The IP address range for the virtual network."
  type        = string
}

variable "location" {
  description = "location"
  type = string
}

variable "resource_group_name" {
  description = "resource_group_name"
  type = string
}

# subnet #
variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The IP address prefix for the subnet."
  type        = string
}

