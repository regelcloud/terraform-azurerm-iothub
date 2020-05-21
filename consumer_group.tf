resource "azurerm_iothub_consumer_group" "cg" {
  name                   = "${var.name}-consumer-group"

  iothub_name            = azurerm_iothub.iothub.name
  eventhub_endpoint_name = "${var.name}-events"
  resource_group_name    = azurerm_resource_group.iothub.name
}

output "consumer_group_id" {
  value = azurerm_iothub_consumer_group.cg.id
}
