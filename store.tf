# # Create Az table storage #

# # Create a storage account
# resource "azurerm_storage_account" "tf-vm-tg" {
#   name                     = var.storage_account_name
#   resource_group_name      = data.azurerm_resource_group.tf-vm-tg.name
#   location                 = data.azurerm_resource_group.tf-vm-tg.location
#   account_tier             = var.account_tier
#   account_replication_type = var.account_replication_type
#   account_kind             = "StorageV2" # (Storage, StorageV2, BlobStorage)
# }

# # Create a table in the storage account
# resource "azurerm_storage_table" "tf_storage_table" {
#   name                 = var.storage_table_name
#   storage_account_name = azurerm_storage_account.tf-vm-tg.name
# }