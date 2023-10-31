provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "r_ota2"
  location = "japaneast"
  tags = {
    owner = "r_ota@ap-com.co.jp"
    source = "terraform"
  }
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "r_ota2-vnet1"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet0" {
  name                 = "rota2vnet1_subnet0"
  address_prefixes     = ["10.1.0.0/24"]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "rota2vnet1_subnet1"
  address_prefixes     = ["10.1.1.0/24"]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
}

# data "external" "vnet" {
#   program = ["cat", "${path.root}/import/vnet.csv"]
# }

# resource "azurerm_virtual_network" "vnet" {
#   name                = data.external.vnet.result.name
#   address_space       = data.external.vnet.result.address_space
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }
