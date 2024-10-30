# Create the Linux virtual machine
resource "azurerm_linux_virtual_machine" "tf-vm-tg" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name # data.azurerm_resource_group.tf-vm-tg.name
  location            = var.location # data.azurerm_resource_group.tf-vm-tg.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.tf-vm-tg.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  computer_name = var.computer_name

  # Configure password-based authentication (insecure!!!)
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.public_ssh_key
  }

  tags = {
    environment = var.environment
  }
}
