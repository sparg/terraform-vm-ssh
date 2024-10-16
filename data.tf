
# 'Data' rather than 'resources' are needed due to subscription requirements.
data "azurerm_resource_group" "tf-vm-tg" {
  name = var.pre_resource_group
}