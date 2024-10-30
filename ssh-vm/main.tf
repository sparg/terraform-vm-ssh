module "virtual_machine" {
  source = "../modules/vm"

  vm_name             = var.vm_name
  resource_group_name = data.azurerm_resource_group.tf-vm-tg.name
  location            = data.azurerm_resource_group.tf-vm-tg.location
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  public_ssh_key      = var.public_ssh_key
  environment         = var.environment

  image_publisher = var.image_publisher
  image_offer     = var.image_offer
  image_sku       = var.image_sku
  image_version   = var.image_version

  computer_name = var.computer_name

  # network
  network_interface_name = var.network_interface_name
  nsg_name               = var.nsg_name
  subnet_id              = module.network.subnet_id # azurerm_subnet.tf-vm-tg.id
}
