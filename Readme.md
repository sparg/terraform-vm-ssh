### Project Structure for Terraform:

### Summary of the necessary elements:
1. **Azure Provider** (`azurerm`).
2. **Resource Group** (`azurerm_resource_group`).
3. **Virtual Network** (`azurerm_virtual_network`).
4. **Subnet** (`azurerm_subnet`).
5. **Network Interface** (`azurerm_network_interface`).
6. **Network Security Group** (`azurerm_network_security_group`) with the SSH rule.
7. **Linux Virtual Machine** (`azurerm_linux_virtual_machine`) with an economical size (e.g., `Standard_B1ls`).
8. **SSH Public Key** for digital certificate authentication.

## root
- **ssh-vm**
  - **backend.tf**
  - **data.tf**
  - **main.tf**
  - **networking.tf**
  - **outputs.tf**
  - **provider.tf**
  - **terraform.tfvars**
  - **variables.tf**

### Note:

Depending on the environment used, you may encounter problems with the extraction and use of the private key, due to permissions issues.

If you encounter this problem use the following command inside “Git Bash”:

```bash
$ terraform output public_ip_address
$ terraform output tls_private_key
$ terraform output -raw tls_private_key > file
$ chmod 600 file
$ ssh user@public_ip -i file
```

Shortcut to open “Git Bash” terminal:
```bash
$ "C:\Program Files\Git\bin\bash.exe" --login -i
```