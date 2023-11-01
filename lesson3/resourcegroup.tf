resource "azurerm_resource_group" "rg" {
  name     = "rg_example"
  location = "japaneast"
  tags = {
    owner = "example@example.com"
    source = "terraform"
  }
}