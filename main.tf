#variable "cloud_id" {}
#variable "cloud_secret" {}
#variable "cloud_tid" {}
#variable "cloud_sid" {}


# Backend initial creation
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
  
  version = "~>2.0"
  client_id     = "${var.cloud_id}"
  client_secret = "${var.cloud_secret}"
  tenant_id     = "${var.cloud_tid}"
  subscription_id = "${var.cloud_sid}"
  features {}
  
}


# Resource group terraform-demo create
resource "azurerm_resource_group" "terraform-demo" {
  
  name     = "terraform-demo"
  location = "koreacentral"
  
}
