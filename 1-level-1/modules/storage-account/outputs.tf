# Output necessary values from the module

output "storage_account_id" {
  description = "The ID of Azure Storage Account"
  value       = azurerm_storage_account.sre_storage.id
}

output "storage_account_primary_access_key" {
  description = "The primary access key for Azure Storage Account"
  value       = azurerm_storage_account.sre_storage.primary_access_key
  sensitive   = true
}

output "storage_account_primary_connection_string" {
  description = "The primary connection string for  Azure Storage Account"
  value       = azurerm_storage_account.sre_storage.primary_connection_string
  sensitive   = true
}

output "container_id" {
  description = "The ID of Azure Storage Container"
  value       = azurerm_storage_container.sre_container.id
}
