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

  #client_id     = "0a9b6acf-87fc-44e5-95d6-1170f2dcce27"
  #client_secret = "Lz.2UycBgLktW1fGoc65P5HMM4FUNC9OTQ"
  #tenant_id     = "cdbb77be-38b6-40d1-b078-b53f5d96ca61"
  #subscription_id = "52487da4-ef68-4ad9-a9d9-05105aa35625"
}


# Configure the Azure provider
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  #version = "~>3.0"
  client_id     = ${client_id}
  client_secret = ${client_secret}
  tenant_id     = ${tenant_id}
  subscription_id = ${subscription_id}
  features {}
}



resource "azurerm_resource_group" "terraform-demo" {
  name     = "terraform-demo"
  location = "koreacentral"
}
