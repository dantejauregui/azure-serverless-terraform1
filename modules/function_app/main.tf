resource "azurerm_service_plan" "asp" {
  name                = "${var.function_app_name}-plan"
  resource_group_name = var.resource_group_name
  location           = var.location
  os_type            = "Linux"
  sku_name           = "Y1"
}

resource "random_string" "function_app_suffix" {
  length  = 6
  upper   = false
  special = false
}
resource "azurerm_linux_function_app" "func" {
  name                       = "${var.function_app_name}${random_string.function_app_suffix.result}"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  service_plan_id            = azurerm_service_plan.asp.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_key

  identity {
    type = "SystemAssigned"
  }
  
  site_config {
    application_stack {
      python_version = "3.9"
    }
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
    COSMOS_DB_CONNECTION_STRING  = var.cosmos_connection_string
  }
}