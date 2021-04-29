terraform {
  backend "azurerm" {
    resource_group_name   = "terraform01"
    storage_account_name  = "axin00terraform"
    container_name        = "terraform01"
    key                   = "terraform.tfstate"
  }
}

# Configure the Azure provider
#provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  #version = "~>3.0"
#  features {}
#}

provider "azuread" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider to be used
  version = "=1.1.0"
}

resource "azurerm_resource_group" "terraform-demo" {
  name     = "terraform-demo"
  location = "koreacentral"
}
