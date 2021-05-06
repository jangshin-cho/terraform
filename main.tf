# .tfvar
variable "cloud_id" {}
variable "cloud_secret" {}
variable "cloud_tid" {}
variable "cloud_sid" {}


# Backend initial creation
terraform {
  
  backend "azurerm" {
    resource_group_name   = "tstate"
    storage_account_name  = "tstate13875"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
  
}

# Configure the Azure provider
provider "azurerm" {
  
  client_id     = "${var.cloud_id}"
  client_secret = "${var.cloud_secret}"
  tenant_id     = "${var.cloud_tid}"
  subscription_id = "${var.cloud_sid}"
  features {}
  
}


# Resource group terraform-demo create
resource "azurerm_resource_group" "terraform-cloud" {
  
  name     = "terraform-cloud"
  location = "koreacentral"
  
}
