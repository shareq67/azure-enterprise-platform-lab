
output "acr_name" {
  description = "Azure Container Registry name"
  value       = azurerm_container_registry.this.name
}

output "acr_login_server" {
  description = "Registry login server"
  value       = azurerm_container_registry.this.login_server
}

output "acr_id" {
  description = "Azure Container Registry resource ID"
  value       = azurerm_container_registry.this.id
}
