# Create VNET
resource "azurerm_virtual_network" "jangshin_net" {
    name = "myVnet"
    address_space = ["10.0.0.0/16"]
    location = "koreacentral"
    resource_group_name = "terraform-cloud"

    tags = {
      environment = "Terraform Test"
    }
    
    depends_on = [ azurerm_resource_group.terraform-cloud ]
}

# Create subnet
resource "azurerm_subnet" "jangshin_subnet" {
    name                 = "choSubnet"
    resource_group_name  = "terraform-cloud"
    virtual_network_name = "myVnet"
    address_prefixes     = ["10.0.1.0/24"]
    
    depends_on = [ azurerm_virtual_network.jangshin_net ]
}
