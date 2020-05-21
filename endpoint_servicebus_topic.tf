resource "azurerm_iothub_endpoint_servicebus_topic" "endpoint_servicebus_topic" {
  resource_group_name = azurerm_resource_group.iothub.name
  iothub_name         = azurerm_iothub.iothub.name
  name                = "${var.name}-endpoint_servicebus_topic"

  connection_string = var.endpoint_servicebus_topic.connection_string
  # azurerm_servicebus_topic_authorization_rule.servicebus_topic_authorization_rule.primary_connection_string
}

output "endpoint_servicebus_topic_id" {
  value = azurerm_iothub_endpoint_servicebus_topic.endpoint_servicebus_topic.id
}
