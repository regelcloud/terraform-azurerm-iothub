resource "azurerm_iothub_route" "route" {
  resource_group_name = azurerm_resource_group.iothub.name
  iothub_name         = azurerm_iothub.iothub.name
  name                = "${var.name}route"

  source         = var.route_source
  condition      = var.route_condition
#   endpoint_names = var.route_endpoint_names
  endpoint_names =   [azurerm_iothub_endpoint_storage_container.endpoint_storage_container.name]
  enabled        = true
}

