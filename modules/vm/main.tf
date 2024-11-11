# Create the Linux virtual machine
resource "azurerm_linux_virtual_machine" "tf-vm-tg" {
  # name                = var.vm_name
  name                = "vm-${var.resource_group_name}-${var.environment}-${lower(replace(var.location, " ", ""))}-${var.instance}"
  resource_group_name = var.resource_group_name # data.azurerm_resource_group.tf-vm-tg.name
  location            = var.location            # data.azurerm_resource_group.tf-vm-tg.location
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

  computer_name = "${var.computer_name}-${var.instance}"

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

# Create a public IP
resource "azurerm_public_ip" "tf-vm-tg" {
  # name                = "public-ip-linux-vm"
  name                = "pip-${var.resource_group_name}-${var.environment}-${lower(replace(var.location, " ", ""))}-${var.instance}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static" # "Dynamic"
  sku                 = "Standard"
}

# Create a network interface
resource "azurerm_network_interface" "tf-vm-tg" {
  # name                = var.network_interface_name
  name                = "nw-${var.resource_group_name}-${var.environment}-${lower(replace(var.location, " ", ""))}-${var.instance}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    # name                          = "ipconfig1"
    name                          = "ipconfig-${var.resource_group_name}-${var.environment}-${lower(replace(var.location, " ", ""))}-${var.instance}"
    subnet_id                     = var.subnet_id # azurerm_subnet.tf-vm-tg.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tf-vm-tg.id
  }
}

# Create a network security group (NSG) to allow SSH traffic (port 22)
resource "azurerm_network_security_group" "tf-vm-tg" {
  # name                = var.nsg_name
  name                = "nsg-${var.resource_group_name}-${var.environment}-${lower(replace(var.location, " ", ""))}-${var.instance}"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-icmp"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the network interface
resource "azurerm_network_interface_security_group_association" "tf-vm-tg" {
  network_interface_id      = azurerm_network_interface.tf-vm-tg.id
  network_security_group_id = azurerm_network_security_group.tf-vm-tg.id
}