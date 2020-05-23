resource "azurerm_iothub_dps_shared_access_policy" "dps_shared_access_policy" {
  name                = "dpssharedaccesspolicy${random_string.random.result}"
  resource_group_name = azurerm_resource_group.iothub.name
  iothub_dps_name     = azurerm_iothub_dps.dps.name

  enrollment_write = true
  enrollment_read  = true

  registration_read = true
  registration_write =  true

  service_config = true
}

output "dps_shared_access_policy_id" {
  value = azurerm_iothub_dps_shared_access_policy.dps_shared_access_policy.id
}

output "dps_shared_access_policy_primary_key" {
  value = azurerm_iothub_dps_shared_access_policy.dps_shared_access_policy.primary_key
}

output "dps_shared_access_policy_primary_connection_string" {
  value = azurerm_iothub_dps_shared_access_policy.dps_shared_access_policy.primary_connection_string
}

output "dps_shared_access_policy_secondary_key" {
  value = azurerm_iothub_dps_shared_access_policy.dps_shared_access_policy.secondary_key
}

output "dps_shared_access_policy_secondary_connection_string" {
  value = azurerm_iothub_dps_shared_access_policy.dps_shared_access_policy.secondary_connection_string
}
