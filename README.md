# terraform-azurerm-iothub
Terraform module for Azure IoTHub

usgae:
```
module "iothub" {
  source = "../modules/azurerm_iothub"
  resource_group_name =  "iothub-resources"
  location =  "Canada Central"
  name = "test-iot-sample-99"
  sku = {
    name = "S1"
    tier = "Standard"
    capacity = "1"
  }
  tags = {
      name = "test"
      environment =  "testing"
  }

}
```
