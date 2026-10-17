output "resource_group_name" {
  value = azurerm_resource_group.network.name
}

output "hub_vnet_name" {
  value = azurerm_virtual_network.hub.name
}

output "workload_vnet_name" {
  value = azurerm_virtual_network.workload.name
}

output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "workload_vnet_id" {
  value = azurerm_virtual_network.workload.id
}

output "subnet_ids" {
  value = {
    shared_services  = azurerm_subnet.shared_services.id
    management       = azurerm_subnet.management.id
    aks_nodes        = azurerm_subnet.aks_nodes.id
    private_endpoints = azurerm_subnet.private_endpoints.id
  }
}
