resource "azurerm_iothub_endpoint_eventhub" "endpoint_eventhub" {
  resource_group_name = azurerm_resource_group.iothub.name
  iothub_name         = azurerm_iothub.iothub.name
  name                = "endpoint_eventhub"

  connection_string =   azurerm_eventhub_authorization_rule.main.primary_connection_string

}

output "endpoint_eventhub_id" {
  value = azurerm_iothub_endpoint_eventhub.endpoint_eventhub.id
}
