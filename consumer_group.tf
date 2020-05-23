resource "azurerm_iothub_consumer_group" "cg" {
  name                   = "consumergroup${random_string.random.result}"
  iothub_name            = azurerm_iothub.iothub.name
  eventhub_endpoint_name = "events"
  resource_group_name    = azurerm_resource_group.iothub.name
}

output "consumer_group_id" {
  value = azurerm_iothub_consumer_group.cg.id
}
