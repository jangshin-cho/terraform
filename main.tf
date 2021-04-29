terraform {
  backend "azurerm" {
    resource_group_name   = "terraform01"
    storage_account_name  = "axin00terraform"
    container_name        = "terraform01"
    key                   = "terraform.tfstate"
  }
}

provider "azuread" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider to be used
  version = "=1.1.0"

  client_id     = "61906777-6663-4775-9824-e7edaff6cd39"
  client_secret = "RAk2j1kYgV5Gw2uvl24Zr_hwGnyLlBQMIO"
  tenant_id     = "cdbb77be-38b6-40d1-b078-b53f5d96ca61"
}


# Configure the Azure provider
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  #version = "~>3.0"
  client_id     = "61906777-6663-4775-9824-e7edaff6cd39"
  client_secret = "RAk2j1kYgV5Gw2uvl24Zr_hwGnyLlBQMIO"
  tenant_id     = "cdbb77be-38b6-40d1-b078-b53f5d96ca61"
  features {}
}



resource "azurerm_resource_group" "terraform-demo" {
  name     = "terraform-demo"
  location = "koreacentral"
}
