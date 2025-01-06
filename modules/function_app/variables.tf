variable "function_app_name" {
  type        = string
  description = "Name of the function app"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "storage_account_key" {
  type        = string
  description = "Primary access key of the storage account"
  sensitive   = true
}

variable "cosmos_connection_string" {
  type        = string
  description = "Cosmos DB connection string"
  sensitive   = true
  default     = ""  # Optional since not all functions need Cosmos DB
}