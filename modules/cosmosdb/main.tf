resource "azurerm_cosmosdb_account" "db" {
  name                = var.cosmos_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  automatic_failover_enabled = false

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  # Network security settings
  is_virtual_network_filter_enabled = true
  
  virtual_network_rule {
    id = var.subnet_id
  }

  # Allow Azure services (like Functions) to access
  ip_range_filter = ""
}

resource "azurerm_cosmosdb_sql_database" "db" {
  name                = var.database_name
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
}

resource "azurerm_cosmosdb_sql_container" "container" {
  name                  = var.container_name
  resource_group_name   = azurerm_cosmosdb_account.db.resource_group_name
  account_name          = azurerm_cosmosdb_account.db.name
  database_name         = azurerm_cosmosdb_sql_database.db.name
  partition_key_paths   = ["/id"]
}

# Role assignment for Function App
resource "azurerm_cosmosdb_sql_role_definition" "function_role" {
  name                = "function-app-role"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  
  assignable_scopes = [azurerm_cosmosdb_account.db.id]
  
  permissions {
    data_actions = [
      "Microsoft.DocumentDB/databaseAccounts/readMetadata",
      "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*",
      "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/*"
    ]
  }
}

resource "random_uuid" "role_assignment_name" {
  # Generating a random UUID for the role assignment name
}
resource "azurerm_cosmosdb_sql_role_assignment" "function_role_assignment" {
  name                = random_uuid.role_assignment_name.result
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  role_definition_id  = azurerm_cosmosdb_sql_role_definition.function_role.id
  principal_id        = var.function_app_principal_id
  scope               = azurerm_cosmosdb_account.db.id
}