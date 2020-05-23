resource "azurerm_iothub_endpoint_servicebus_queue" "endpoint_servicebus_queue" {
  resource_group_name = azurerm_resource_group.iothub.name
  iothub_name         = azurerm_iothub.iothub.name
  name                = "endpointServicebusQueue"

  connection_string =   azurerm_servicebus_queue_authorization_rule.main.primary_connection_string

}

output "endpoint_servicebus_queue_id" {
  value = azurerm_iothub_endpoint_servicebus_queue.endpoint_servicebus_queue.id
}
