output "storage_subnet_id" {
  value = azurerm_subnet.storage.id
}

output "cosmos_subnet_id" {
  value = azurerm_subnet.cosmos.id
}