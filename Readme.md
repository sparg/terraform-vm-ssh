### Resumen de los elementos necesarios:
1. **Proveedor de Azure** (`azurerm`).
2. **Grupo de recursos** (`azurerm_resource_group`).
3. **Red virtual** (`azurerm_virtual_network`).
4. **Subred** (`azurerm_subnet`).
5. **Interfaz de red** (`azurerm_network_interface`).
6. **Grupo de seguridad de red** (`azurerm_network_security_group`) con la regla para SSH.
7. **Máquina virtual Linux** (`azurerm_linux_virtual_machine`) con el tamaño económico (por ejemplo, `Standard_B1ls`).
8. **Clave pública SSH** para la autenticación por certificado digital.
