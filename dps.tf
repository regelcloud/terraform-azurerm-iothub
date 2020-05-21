resource "azurerm_iothub_dps" "dps" {
  name                = "${var.name}-dps"
  resource_group_name = azurerm_resource_group.iothub.name
  location            = azurerm_resource_group.iothub.location

  sku {
    name     = var.dps_sku_name
    capacity = var.sku.capacity
  }

  linked_hub {
      connection_string = var.linked_hub_connection_string
      location = var.linked_hub_location
      apply_allocation_policy = var.linked_hub_apply_allocation_policy
      allocation_weight = var.linked_hub_allocation_weight
      hostname = azurerm_iothub.iothub.hostname
  }
}

output "dps_id" {
  value = azurerm_iothub_dps.dps.id
}

output "dps_allocation_policy" {
  value = azurerm_iothub_dps.dps.allocation_policy
}

output "dps_device_provisioning_host_name" {
  value = azurerm_iothub_dps.dps.device_provisioning_host_name
}

output "dps_id_scope" {
  value = azurerm_iothub_dps.dps.id_scope
}

output "dps_service_operations_host_name" {
  value = azurerm_iothub_dps.dps.service_operations_host_name
}

