# resource "azurerm_iothub_dps_certificate" "dps_certificate" {
#   name                = "${var.name}-dps-certificate"
#   resource_group_name = azurerm_resource_group.iothub.name
#   iot_dps_name        = azurerm_iothub_dps.dps.name
# ## TODO: Take  certificate content from file
#   certificate_content = filebase64(var.certificate_file)
# }

# output "dps_cert_id" {
#   value = azurerm_iothub_dps_certificate.dps_certificate.id
# }
