provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "~> 2.9"
  features {}
}
resource "azurerm_resource_group" "iothub" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_iothub" "iothub" {
  name                     = var.name
  resource_group_name      = azurerm_resource_group.iothub.name
  location                 = azurerm_resource_group.iothub.location
  sku  {
    name = var.sku.name
    capacity = var.sku.capacity
  }

  tags =  var.tags

  event_hub_partition_count =  var.event_hub_partition_count
  event_hub_retention_in_days  =  var.event_hub_retention_in_days
  
  ##  Optional Configs
  # dynamic "endpoint" {
  #   for_each =  [for e in var.endpoints: {
  #     type  = e.type
  #     name = e.name
  #     connection_string = e.connection_string
  #     batch_frequency_in_seconds =  e.batch_frequency_in_seconds
  #     max_chunk_size_in_bytes = e.max_chunk_size_in_bytes
  #     container_name  = e.container_name
  #     encoding  = e.encoding
  #     file_name_format = e.file_name_format
  #   }]
  
  #   content {
  #     type =  endpoint.value.type
  #     name =  endpoint.value.name
  #     connection_string = endpoint.value.connection_string
  #     batch_frequency_in_seconds =  endpoint.value.batch_frequency_in_seconds
  #     max_chunk_size_in_bytes = endpoint.value.max_chunk_size_in_bytes
  #     container_name  = endpoint.value.container_name
  #     encoding  = endpoint.value.encoding
  #     file_name_format = endpoint.value.file_name_format
  #   }
  # }


  # dynamic "route" {
  #   for_each =  [for r in var.routes: {
  #       name           = r.name
  #       source         = r.source
  #       condition      = r.condition
  #       endpoint_names = r.endpoint_names
  #       enabled        = r.enabled
  #   }]
    
  #   content {
  #       name           = route.value.name
  #       source         = route.value.source
  #       condition      = route.value.condition
  #       endpoint_names = route.value.endpoint_names
  #       enabled        = route.value.enabled
  #   }
    # }

    
# ip_filter_rule {
#   name = var.ip_filter_rule.name
#   ip_mask  =  var.ip_filter_rule.ip_mask
#   action = var.ip_filter_rule.action
#   }



}


