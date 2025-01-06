output "function_app_name" {
  value = module.function_app.function_app_name
}

output "function_app_hostname" {
  value = module.function_app.function_app_hostname
}

output "storage_account_name" {
  value = module.storage.name
}

output "blob_container_name" {
  value = module.blob_storage.container_name
}

output "resource_group_name" {
  value = module.resource_group.name
}