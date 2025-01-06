terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
module "resource_group" {
  source = "./modules/resource_group"
  
  resource_group_name = var.resource_group_name
  location           = var.location
}

# Networking
module "networking" {
  source = "./modules/networking"
  
  resource_group_name = module.resource_group.name
  location           = module.resource_group.location
}

# Storage Account
module "storage" {
  source = "./modules/storage"
  
  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.networking.storage_subnet_id
}

# Blob Storage
module "blob_storage" {
  source = "./modules/blob_storage"
  
  storage_account_name = module.storage.name
  container_name      = var.blob_container_name
}

# Function App
module "function_app" {
  source = "./modules/function_app"
  
  function_app_name        = var.function_app_name
  resource_group_name      = module.resource_group.name
  location                = module.resource_group.location
  storage_account_name     = module.storage.name
  storage_account_key      = module.storage.primary_access_key
}

# Cosmos DB
module "cosmosdb" {
  source = "./modules/cosmosdb"
  
  cosmos_account_name       = var.cosmos_account_name
  database_name            = var.cosmos_database_name
  resource_group_name      = module.resource_group.name
  location                = module.resource_group.location
  subnet_id               = module.networking.cosmos_subnet_id
  function_app_principal_id = module.function_app.principal_id
}