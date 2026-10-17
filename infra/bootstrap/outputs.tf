output "state_resource_group_name" {
  value = azurerm_resource_group.state.name
}

output "state_storage_account_name" {
  value = azurerm_storage_account.state.name
}

output "state_container_name" {
  value = azurerm_storage_container.state.name
}

output "state_location" {
  value = azurerm_storage_account.state.location
}

output "backend_hcl_example" {
  description = "Copy these values into a local, untracked backend.hcl file for the lab environment."
  value       = <<-EOT
resource_group_name  = "${azurerm_resource_group.state.name}"
storage_account_name = "${azurerm_storage_account.state.name}"
container_name       = "${azurerm_storage_container.state.name}"
key                  = "lab-network.tfstate"
use_azuread_auth     = true
EOT
}
