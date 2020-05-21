resource "azurerm_iothub_route" "route" {
  resource_group_name = azurerm_resource_group.iothub.name
  iothub_name         = azurerm_iothub.iothub.name
  name                = "${var.name}-route"

  source         = var.route_source
  condition      = "true"
  endpoint_names = var.route_endpoint_names
  enabled        = true
}

