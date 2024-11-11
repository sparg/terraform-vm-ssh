module "virtual_machine" {
  depends_on = [module.certificates]
  source     = "../modules/vm"

  instance            = var.instance
  resource_group_name = data.azurerm_resource_group.tf-vm-tg.name
  location            = data.azurerm_resource_group.tf-vm-tg.location
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  public_ssh_key      = module.certificates.public_key
  environment         = var.environment

  image_publisher = var.image_publisher
  image_offer     = var.image_offer
  image_sku       = var.image_sku
  image_version   = var.image_version

  computer_name = var.computer_name

  # network
  subnet_id = module.network.subnet_id # azurerm_subnet.tf-vm-tg.id
}
