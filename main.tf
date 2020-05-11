provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "~> 2.9"
  features {}
}
resource "azurerm_resource_group" "iothub" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_iothub" "iothub" {
  name                     = var.name
  resource_group_name      = azurerm_resource_group.iothub.name
  location                 = azurerm_resource_group.iothub.location
  sku  {
    name = var.sku.name
    # tier = var.sku.tier
    capacity = var.sku.capacity
  }

  tags =  {
    Name = var.tags.name
    Environment = var.tags.environment
  }

  
}