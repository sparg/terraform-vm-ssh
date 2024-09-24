# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # version = "~> 3.0.2"
      version = ">= 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

# Configure the Azure provider
provider "azurerm" {
  features {}
}
