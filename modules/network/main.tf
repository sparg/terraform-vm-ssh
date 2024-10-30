# Create a virtual network
resource "azurerm_virtual_network" "tf-vm-tg" {
  name                = var.virtual_network_name
  address_space       = [var.address_space]
  location            = var.location # data.azurerm_resource_group.tf-vm-tg.location
  resource_group_name = var.resource_group_name # data.azurerm_resource_group.tf-vm-tg.name
}

# Create a subnet
resource "azurerm_subnet" "tf-vm-tg" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.tf-vm-tg.name
  address_prefixes     = [var.subnet_address_prefix]
}
