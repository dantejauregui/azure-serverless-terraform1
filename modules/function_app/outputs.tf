output "function_app_name" {
  value = azurerm_linux_function_app.func.name
}

output "function_app_hostname" {
  value = azurerm_linux_function_app.func.default_hostname
}

output "principal_id" {
  value = azurerm_linux_function_app.func.identity.0.principal_id
}