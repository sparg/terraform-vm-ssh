variable "location" {
  description = "Ubicación de Azure donde se desplegará la máquina virtual."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "El nombre del grupo de recursos."
  type        = string
  default     = "rg-linux-vm"
}

variable "virtual_network_name" {
  description = "El nombre de la red virtual."
  type        = string
  default     = "vnet-linux"
}

variable "address_space" {
  description = "El rango de direcciones IP de la red virtual."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "El nombre de la subred."
  type        = string
  default     = "subnet-linux"
}

variable "subnet_address_prefix" {
  description = "El prefijo de direcciones IP de la subred."
  type        = string
  default     = "10.0.1.0/24"
}

variable "network_interface_name" {
  description = "El nombre de la interfaz de red."
  type        = string
  default     = "nic-linux-vm"
}

variable "nsg_name" {
  description = "El nombre del grupo de seguridad de red."
  type        = string
  default     = "nsg-linux"
}

variable "vm_name" {
  description = "El nombre de la máquina virtual."
  type        = string
  default     = "vm-linux"
}

variable "vm_size" {
  description = "El tamaño de la máquina virtual."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "El nombre del usuario administrador de la máquina virtual."
  type        = string
  default     = "ivan"
}

variable "environment" {
  description = "Etiqueta para especificar el entorno (producción, desarrollo, etc.)."
  type        = string
  default     = "testing"
}

variable "admin_password" {
  description = "La contraseña del administrador para la máquina virtual."
  type        = string
  sensitive   = true            # Marca la contraseña como sensible
  default     = "P@ssw0rd2024!" # ojo! tiene que ser segura.
}
