resource "azurerm_iothub_fallback_route" "fallback_route" {
  resource_group_name = azurerm_resource_group.iothub.name
  iothub_name         = azurerm_iothub.iothub.name

  condition      = "true"
  endpoint_names = [azurerm_iothub_endpoint_storage_container.endpoint_storage_container.name]
  enabled        = true
}

