# We host tfstate in the cloud (pre-existing and independent resource)
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-demo-states-rg"
    storage_account_name = "ernitfdemostates"
    container_name       = "terraform-state"
    key                  = "terraform-ivan-demo/terraform.tfstate"
  }
}