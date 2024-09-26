# Create a resource group
resource "azurerm_resource_group" "tf-vm-tg" {
  name     = var.resource_group_name
  location = var.location
}

# Create a virtual network
resource "azurerm_virtual_network" "tf-vm-tg" {
  name                = var.virtual_network_name
  address_space       = [var.address_space]
  location            = azurerm_resource_group.tf-vm-tg.location
  resource_group_name = azurerm_resource_group.tf-vm-tg.name
}

# Create a subnet
resource "azurerm_subnet" "tf-vm-tg" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.tf-vm-tg.name
  virtual_network_name = azurerm_virtual_network.tf-vm-tg.name
  address_prefixes     = [var.subnet_address_prefix]
}

# Create a public IP
resource "azurerm_public_ip" "tf-vm-tg" {
  name                = "public-ip-linux-vm"
  location            = azurerm_resource_group.tf-vm-tg.location
  resource_group_name = azurerm_resource_group.tf-vm-tg.name
  allocation_method = "Static"   # "Dynamic"
  sku               = "Standard"
}

# Create a network interface
resource "azurerm_network_interface" "tf-vm-tg" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.tf-vm-tg.location
  resource_group_name = azurerm_resource_group.tf-vm-tg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.tf-vm-tg.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tf-vm-tg.id
  }
}

# Create a network security group (NSG) to allow HTTP traffic (port 80)
resource "azurerm_network_security_group" "tf-vm-tg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.tf-vm-tg.location
  resource_group_name = azurerm_resource_group.tf-vm-tg.name

  security_rule {
    name                       = "allow_http"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the network interface
resource "azurerm_network_interface_security_group_association" "tf-vm-tg" {
  network_interface_id      = azurerm_network_interface.tf-vm-tg.id
  network_security_group_id = azurerm_network_security_group.tf-vm-tg.id
}

# Create TLS
resource "tls_private_key" "tf-vm-tg" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "tls_self_signed_cert" "tf-vm-tg" {
  subject {
    common_name  = "tf-vm-tg.com"
    organization = "tf-vm-tg Co"
  }

  validity_period_hours = var.validity_period_hours
  dns_names             = ["tf-vm-tg.com"]
  # key_algorithm         = var.key_algorithm
  private_key_pem = tls_private_key.tf-vm-tg.private_key_pem

  allowed_uses = ["key_encipherment", "digital_signature", "server_auth"]
  # The `allowed_uses` parameter specifies the intended purposes for the self-signed certificate.
  # key_encipherment: Allows the use of the certificate for encrypting keys.
  # digital_signature: Permits the certificate to be used for creating digital signatures.
  # server_auth: Enables the certificate to be used for server authentication.
}
####

# Create the Linux virtual machine
resource "azurerm_linux_virtual_machine" "tf-vm-tg" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.tf-vm-tg.name
  location            = azurerm_resource_group.tf-vm-tg.location
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

  # Configure password-based authentication (insecure!!!)
  disable_password_authentication = false
  admin_password                  = var.admin_password

  tags = {
    environment = var.environment
  }
}
