resource "azurerm_storage_account" "main" {
  name                     = "azstorageaccountsample"
  resource_group_name      = azurerm_resource_group.iothub.name
  location                 = azurerm_resource_group.iothub.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "main" {
  name                  = "${var.name}-storage-container"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

resource "azurerm_eventhub_namespace" "main" {
  name                = "${var.name}-namespace"
  resource_group_name = azurerm_resource_group.iothub.name
  location            = azurerm_resource_group.iothub.location
  sku                 = "Basic"
}

resource "azurerm_eventhub" "main" {
  name                = "${var.name}-eventhub"
  resource_group_name = azurerm_resource_group.iothub.name
  namespace_name      = azurerm_eventhub_namespace.main.name
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_eventhub_authorization_rule" "main" {
  resource_group_name = azurerm_resource_group.iothub.name
  namespace_name      = azurerm_eventhub_namespace.main.name
  eventhub_name       = azurerm_eventhub.main.name
  name                = "${var.name}-auth-rule"
  send                = true
}



####  Service Bus

resource "azurerm_servicebus_namespace" "main" {
  name                = "${var.name}-serviceBusNamespace"
  location            = azurerm_resource_group.iothub.location
  resource_group_name = azurerm_resource_group.iothub.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "main" {
  name                = "sampleServiceBusQueue"
  resource_group_name = azurerm_resource_group.iothub.name
  namespace_name      = azurerm_servicebus_namespace.main.name

  enable_partitioning = true
}

resource "azurerm_servicebus_queue_authorization_rule" "main" {
  name                = "sampleServiceBusRule"
  namespace_name      = azurerm_servicebus_namespace.main.name
  queue_name          = azurerm_servicebus_queue.main.name
  resource_group_name = azurerm_resource_group.iothub.name

  listen = false
  send   = true
  manage = false
}



resource "azurerm_servicebus_topic" "main" {
  name                = "sampleServiceBusTopic"
  resource_group_name = azurerm_resource_group.iothub.name
  namespace_name      = azurerm_servicebus_namespace.main.name
}

resource "azurerm_servicebus_topic_authorization_rule" "main" {
  name                = "sampleServiceBusRule"
  namespace_name      = azurerm_servicebus_namespace.main.name
  topic_name          = azurerm_servicebus_topic.main.name
  resource_group_name = azurerm_resource_group.iothub.name

  listen = false
  send   = true
  manage = false
}