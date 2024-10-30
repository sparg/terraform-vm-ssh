module "network" {
  source                 = "./modules/network"
  virtual_network_name   = var.virtual_network_name
  address_space          = var.address_space
  subnet_name            = var.subnet_name
  subnet_address_prefix  = var.subnet_address_prefix
  network_interface_name = var.network_interface_name
  nsg_name               = var.nsg_name
  location               = data.azurerm_resource_group.tf-vm-tg.location
  resource_group_name    = data.azurerm_resource_group.tf-vm-tg.name
}
