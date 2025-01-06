variable "cosmos_account_name" {
  type        = string
  description = "Name of the Cosmos DB account"
}

variable "database_name" {
  type        = string
  description = "Name of the Cosmos DB database"
}

variable "container_name" {
  type        = string
  description = "Name of the Cosmos DB container"
  default     = "items"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to connect the Cosmos DB account to"
}

variable "function_app_principal_id" {
  type        = string
  description = "Principal ID of the Function App's managed identity"
}