# Create VNET
resource "azurerm_virtual_network" "terraformnetwork" {
    name = "myVnet"
    address_space = ["10.0.0.0/16"]
    location = "koreacentral"
    resource_group_name = "terraform-demo"

    tags = {
      environment = "Terraform Test"
    }
}

# Create subnet
resource "azurerm_subnet" "terraformsubnet" {
    name                 = "choSubnet"
    resource_group_name  = "terraform-demo"
    virtual_network_name = "myVnet"
    address_prefixes     = ["10.0.1.0/24"]
}
