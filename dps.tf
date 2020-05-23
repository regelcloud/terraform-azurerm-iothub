resource "azurerm_iothub_dps" "dps" {
  name                = "dps${random_string.random.result}"
  resource_group_name = azurerm_resource_group.iothub.name
  location            = azurerm_resource_group.iothub.location
  ##########################################
  ###dps is availabile in  below regions #####
  ### 'eastus,westus,westeurope,northeurope,southeastasia,eastasia,
  ###  australiaeast,australiasoutheast,japanwest,japaneast,ukwest,
  ### uksouth,eastus2,centralus,westus2,westcentralus,northcentralus,southcentralus'
  ##########################################
  # location              = 

  sku {
    name     = var.dps_sku_name
    capacity = var.dps_sku_capacity
  }

  # dynamic "linked_hub" {
  #   for_each =  var.linked_hubs == [] ? [] : [for r in var.linked_hubs: {
  #       connection_string           = r.connection_string
  #       location                    = r.location
  #       apply_allocation_policy     = r.apply_allocation_policy
  #       allocation_weight           = r.allocation_weight
  #       hostname                    = r.hostname
  #   }]
  #     content {
  #       connection_string           = linked_hub.value.connection_string
  #       location         = linked_hub.value.location
  #       apply_allocation_policy      = linked_hub.value.apply_allocation_policy
  #       allocation_weight = linked_hub.value.allocation_weight
  #       hostname        = linked_hub.value.hostname
  #   }
  #   }
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