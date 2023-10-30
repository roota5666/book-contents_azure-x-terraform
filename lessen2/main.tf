provider "azurerm" {
  features {}
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1_example"
  address_prefixes     = ["10.1.1.0/24"]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
}

resource "azurerm_subnet" "subnet0" {
  name                 = "subnet0_example"
  address_prefixes     = ["10.1.0.0/24"]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet_example"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_resource_group" "rg" {
  name     = "rg_example"
  location = "japaneast"
  tags = {
    owner = "example@example.com"
    source = "terraform"
  }
}
