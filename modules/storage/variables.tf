variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
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
  description = "ID of the subnet to connect the storage account to"
}