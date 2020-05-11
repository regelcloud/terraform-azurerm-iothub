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
  default = {
  }
  }

variable "event_hub_retention_in_days" {
  default = 1
  type = number
  description = "(Optional) The event hub retention to use in days. Must be between 1 and 7."
}

variable "event_hub_partition_count" {
    default =  2
    type =  number
    description  = "(Optional) The number of device-to-cloud partitions used by backing event hubs. Must be between 2 and 128."
}

# An endpoint block supports the following:
# type - (Required) The type of the endpoint. Possible values are AzureIotHub.StorageContainer, AzureIotHub.ServiceBusQueue, AzureIotHub.ServiceBusTopic or AzureIotHub.EventHub.
# connection_string - (Required) The connection string for the endpoint.
# name - (Required) The name of the endpoint. The name must be unique across endpoint types. The following names are reserved: events, operationsMonitoringEvents, fileNotifications and $default.
# batch_frequency_in_seconds - (Optional) Time interval at which blobs are written to storage. Value should be between 60 and 720 seconds. Default value is 300 seconds. This attribute is mandatory for endpoint type AzureIotHub.StorageContainer.
# max_chunk_size_in_bytes - (Optional) Maximum number of bytes for each blob written to storage. Value should be between 10485760(10MB) and 524288000(500MB). Default value is 314572800(300MB). This attribute is mandatory for endpoint type AzureIotHub.StorageContainer.
# container_name - (Optional) The name of storage container in the storage account. This attribute is mandatory for endpoint type AzureIotHub.StorageContainer.
# encoding - (Optional) Encoding that is used to serialize messages to blobs. Supported values are 'avro' and 'avrodeflate'. Default value is 'avro'. This attribute is mandatory for endpoint type AzureIotHub.StorageContainer.
# file_name_format - (Optional) File name format for the blob. Default format is {iothub}/{partition}/{YYYY}/{MM}/{DD}/{HH}/{mm}. All parameters are mandatory but can be reordered. This attribute is mandatory for endpoint type AzureIotHub.StorageContainer.


variable "endpoints" {
  type =  list
  default  = [{
    type              = ""
    connection_string = ""
    name              = ""
    batch_frequency_in_seconds = 60
    max_chunk_size_in_bytes    = 10485760
    container_name             = ""
    encoding                   = "Avro"
    file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"

  }
  ]
}


variable "routes" {
    type  = list
    default = [{
        name           = ""
        source         = ""
        condition      = true
        endpoint_names = [""]
        enabled        = true
    }]
}

# An ip_filter_rule block supports the following:
# name - (Required) The name of the filter.
# ip_mask - (Required) The IP address range in CIDR notation for the rule.
# action - (Required) The desired action for requests captured by this rule. Possible values are Accept, Reject

variable "ip_filter_rule" {
  type = map
  default  =  {
      name = "Allow ALL"
      ip_mask =  "0.0.0.0/0"
      action =  "Accept"
  }
}


# A fallback_route block supports the following:
# source - (Optional) The source that the routing rule is to be applied to, such as DeviceMessages. Possible values include: RoutingSourceInvalid, RoutingSourceDeviceMessages, RoutingSourceTwinChangeEvents, RoutingSourceDeviceLifecycleEvents, RoutingSourceDeviceJobLifecycleEvents.
# condition - (Optional) The condition that is evaluated to apply the routing rule. If no condition is provided, it evaluates to true by default. For grammar, see: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-query-language.
# endpoint_names - (Optional) The endpoints to which messages that satisfy the condition are routed. Currently only 1 endpoint is allowed.
# enabled - (Optional) Used to specify whether the fallback route is enabled.

variable "fallback_route" {
  type  =  list
  default  = [ {
      source = ""
      condition = true
      endpoint_names =  [""]
      enabled = false
  }]
}


# A file_upload block supports the following:
# connection_string - (Required) The connection string for the Azure Storage account to which files are uploaded.
# container_name - (Required) The name of the root container where you upload files. The container need not exist but should be creatable using the connection_string specified.
# sas_ttl - (Optional) The period of time for which the SAS URI generated by IoT Hub for file upload is valid, specified as an ISO 8601 timespan duration. This value must be between 1 minute and 24 hours, and evaluates to 'PT1H' by default.
# notifications - (Optional) Used to specify whether file notifications are sent to IoT Hub on upload. It evaluates to false by default.
# lock_duration - (Optional) The lock duration for the file upload notifications queue, specified as an ISO 8601 timespan duration. This value must be between 5 and 300 seconds, and evaluates to 'PT1M' by default.
# default_ttl - (Optional) The period of time for which a file upload notification message is available to consume before it is expired by the IoT hub, specified as an ISO 8601 timespan duration. This value must be between 1 minute and 48 hours, and evaluates to 'PT1H' by default.
# max_delivery_count - (Optional) The number of times the IoT hub attempts to deliver a file upload notification message. It evaluates to 10 by default.


variable "file_upload" {
  type  = list
  default = [{
      connection_string = ""
      container_name = ""
      sas_ttl = 1
      notifications = false
      lock_duration = 1
      default_ttl = 1
      max_delivery_count = 10
  }]
}
