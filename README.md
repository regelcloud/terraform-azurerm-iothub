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


Advanced Usgae:
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
      purpose = "12 test"
  }


endpoints = [
  {
    type                       = "AzureIotHub.StorageContainer"
    connection_string          = ""
    name                       = "export"
    batch_frequency_in_seconds = 60
    max_chunk_size_in_bytes    = 10485760
    container_name             = ""
    encoding                   = "Avro"
    file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
  }
]

routes = [
    {
        name           = "export"
        source         = "DeviceMessages"
        condition      = "true"
        endpoint_names = ["export"]
        enabled        = true
    }
]
}
```
