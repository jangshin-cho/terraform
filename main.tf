variable "cloud_id" {}
variable "cloud_secret" {}
variable "cloud_tid" {}
variable "cloud_sid" {}

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
  client_id     = "${var.cloud_id}"
  client_secret = "${var.cloud_secret}"
  tenant_id     = "${var.cloud_tid}"
  subscription_id = "${var.cloud_sid}"
  features {}
}



resource "azurerm_resource_group" "terraform-demo" {
  name     = "terraform-demo"
  location = "koreacentral"
}
