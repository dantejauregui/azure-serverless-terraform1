variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "dante_test"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "myfuncstorage"
}

variable "function_app_name" {
  type        = string
  description = "Name of the function app"
  default     = "myfuncapp"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "westeurope"
}

variable "blob_container_name" {
  type        = string
  description = "Name of the blob container"
  default     = "function-triggers"
}

variable "cosmos_account_name" {
  type        = string
  description = "Name of the Cosmos DB account"
  default     = "mycosmosdb111"
}

variable "cosmos_database_name" {
  type        = string
  description = "Name of the Cosmos DB database"
  default     = "myappdb"
}