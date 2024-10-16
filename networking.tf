# Create a virtual network
resource "azurerm_virtual_network" "tf-vm-tg" {
  name                = var.virtual_network_name
  address_space       = [var.address_space]
  location            = data.azurerm_resource_group.tf-vm-tg.location
  resource_group_name = data.azurerm_resource_group.tf-vm-tg.name
}

# Create a subnet
resource "azurerm_subnet" "tf-vm-tg" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.tf-vm-tg.name
  virtual_network_name = azurerm_virtual_network.tf-vm-tg.name
  address_prefixes     = [var.subnet_address_prefix]
}

# Create a public IP
resource "azurerm_public_ip" "tf-vm-tg" {
  name                = "public-ip-linux-vm"
  location            = data.azurerm_resource_group.tf-vm-tg.location
  resource_group_name = data.azurerm_resource_group.tf-vm-tg.name
  allocation_method   = "Static" # "Dynamic"
  sku                 = "Standard"
}

# Create a network interface
resource "azurerm_network_interface" "tf-vm-tg" {
  name                = var.network_interface_name
  location            = data.azurerm_resource_group.tf-vm-tg.location
  resource_group_name = data.azurerm_resource_group.tf-vm-tg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.tf-vm-tg.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tf-vm-tg.id
  }
}

# Create a network security group (NSG) to allow SSH traffic (port 22)
resource "azurerm_network_security_group" "tf-vm-tg" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.tf-vm-tg.location
  resource_group_name = data.azurerm_resource_group.tf-vm-tg.name

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
