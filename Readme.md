### Summary of the necessary elements:
1. **Azure Provider** (`azurerm`).
2. **Resource Group** (`azurerm_resource_group`).
3. **Virtual Network** (`azurerm_virtual_network`).
4. **Subnet** (`azurerm_subnet`).
5. **Network Interface** (`azurerm_network_interface`).
6. **Network Security Group** (`azurerm_network_security_group`) with the SSH rule.
7. **Linux Virtual Machine** (`azurerm_linux_virtual_machine`) with an economical size (e.g., `Standard_B1ls`).
8. **SSH Public Key** for digital certificate authentication.
