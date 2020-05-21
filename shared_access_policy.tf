resource "azurerm_iothub_shared_access_policy" "shared_access_policy" {
  name                = "${var.name}-shared_access_policy"
  resource_group_name = azurerm_resource_group.iothub.name
  iothub_name         = azurerm_iothub.iothub.name

  registry_read  = true
  registry_write = true
  service_connect = true
  device_connect = true
}

output "shared_access_policy_id" {
  value =  azurerm_iothub_shared_access_policy.shared_access_policy.id 
}

output "shared_access_policy_primary_key" {
  value =  azurerm_iothub_shared_access_policy.shared_access_policy.primary_key
}

output "shared_access_policy_primary_connection_string" {
  value =  azurerm_iothub_shared_access_policy.shared_access_policy.primary_connection_string
}

output "shared_access_policy_secondary_key" {
  value =  azurerm_iothub_shared_access_policy.shared_access_policy.secondary_key
}

output "shared_access_policy_secondary_connection_string" {
  value =  azurerm_iothub_shared_access_policy.shared_access_policy.secondary_connection_string
}

