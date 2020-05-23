# Terraform module for Azure IoTHub
How to use:
```
# terraform init
# terraform plan
# terraform  apply
```
usgae:
```
module "iothub" {
  source = "../modules/azurerm_iothub"
  resource_group_name =  "iothub-resources"
  location =  "East Asia"
  name = "sampleiotapp"
  sku_name = "S1"
  sku_capacity = "1"

  tags = {
      name = "IoTHub"
      environment =  "Development"
  }

}

```
Advanced Usgae:
```
module "iothub" {
  source = "../modules/azurerm_iothub"
  resource_group_name =  "iothub-resources"
  location =  "East Asia"
  name = "sampleiotapp"
  sku_name = "S1"
  sku_capacity = "1"


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
