variable "resource_group_name" {
  description = "(Required) The name of the resource group under which the IotHub resource has to be created"
}

variable "location" {
    description = "(Required) Resource Group location"
}


variable "name" {
  description = "(Required) Specifies the name of the IotHub resource. Changing this forces a new resource to be created."
}

# A sku block supports the following:
# name - (Required) The name of the sku. Possible values are F1, S1, S2, and S3.
# tier - (Required) The billing tier for the IoT Hub. Possible values are Free or Standard.
# capacity - (Required) The number of provisioned IoT Hub units.

variable "sku" {
  type = map
  default = {
      name =  ""
      tier  =  ""
      capacity  = ""
  }
}

## tags for resources
variable "tags" {
  type =  map
  default =  {
      name = ""
      environment  = ""
  }
}



