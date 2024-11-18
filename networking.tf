module "network" {
  source = "git::https://github.com/sparg/tf-module-az-net.git?ref=v1.0.0"

  address_space         = var.address_space
  subnet_address_prefix = var.subnet_address_prefix
  location              = data.azurerm_resource_group.tf-vm-tg.location
  resource_group_name   = data.azurerm_resource_group.tf-vm-tg.name
  instance              = var.instance
  environment           = var.environment
}
