

resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = var.dns_prefix

  sku_tier = "Free"

  default_node_pool {
    name            = "system"
    node_count      = 1
    vm_size         = var.node_vm_size
    os_disk_size_gb = 30
    type            = "VirtualMachineScaleSets"

    upgrade_settings {
      max_surge = "10%"
    }
  }
  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    load_balancer_sku   = "standard"
    service_cidr        = "10.30.0.0/16"
    dns_service_ip      = "10.30.0.10"
    network_data_plane  = "azure"
  }

  tags = var.tags
}
