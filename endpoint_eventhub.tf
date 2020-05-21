resource "azurerm_iothub_endpoint_eventhub" "endpoint_eventhub" {
  resource_group_name = azurerm_resource_group.iothub.name
  iothub_name         = azurerm_iothub.iothub.name
  name                = "${var.name}-endpoint_eventhub"

  connection_string = var.endpoint_eventhub.connection_string
}

output "endpoint_eventhub_id" {
  value = azurerm_iothub_endpoint_eventhub.endpoint_eventhub.id
}
