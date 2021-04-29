terraform {
  backend "azurerm" {
    resource_group_name   = "terraform01"
    storage_account_name  = "axin00terraform"
    container_name        = "terraform01"
    key                   = "terraform.tfstate"
  }
}

# Configure the Azure provider
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "terraform-demo" {
  name     = "terraform-demo"
  location = "koreacentral"
}
