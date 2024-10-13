# resource "null_resource" "enable_jit" {
#   provisioner "local-exec" {
#     command = <<EOT
#       az login --service-principal -u ${var.client_id} -p ${var.client_secret} --tenant ${var.tenant_id}
#       az security jit-policy set --resource-group ${azurerm_resource_group.example.name} --vm ${azurerm_linux_virtual_machine.example.name} --ports 22 --duration 1h
#     EOT
#   }

#   depends_on = [azurerm_linux_virtual_machine.example]
# }

# # Resource for inserting outputs in the storage table.
# resource "null_resource" "insert_outputs" {
#   depends_on = [
#     # azurerm_storage_table.tf_storage_table,
#     azurerm_public_ip.tf-vm-tg
#   ]
#   # tls_self_signed_cert.tf-vm-tg
#   # tls_private_key.tf-vm-tg

#   provisioner "local-exec" {
#     command = <<EOT
#     echo ${var.private_ssh_key} > /tmp/private_key.pem
#   EOT
#   }
#   # provisioner "local-exec" {
#   #   command = <<EOT
#   #     az storage entity insert --account-name ${azurerm_storage_account.tf-vm-tg.name} --account-key YOUR_ACCOUNT_KEY --table-name ${azurerm_storage_table.tf_storage_table.name} --entity "{\"PartitionKey\":\"vm_output\", \"RowKey\":\"1\", \"PublicIpAddress\":\"${azurerm_public_ip.tf-vm-tg.ip_address}\"}"
#   #   EOT
#   # }
#   # az storage entity insert --account-name ${azurerm_storage_account.tf-vm-tg.name} --account-key YOUR_ACCOUNT_KEY --table-name ${azurerm_storage_table.tf_storage_table.name} --entity "{\"PartitionKey\":\"vm_output\", \"RowKey\":\"2\", \"Certificate\":\"${tls_self_signed_cert.tf-vm-tg.cert_pem}\"}"
#   # az storage entity insert --account-name ${azurerm_storage_account.tf-vm-tg.name} --account-key YOUR_ACCOUNT_KEY --table-name ${azurerm_storage_table.tf_storage_table.name} --entity "{\"PartitionKey\":\"vm_output\", \"RowKey\":\"3\", \"PrivateKey\":\"${nonsensitive(tls_private_key.tf-vm-tg.private_key_pem)}\"}"
# }