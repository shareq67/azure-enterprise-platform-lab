module "networking" {
  source = "../../modules/networking"

  project_name           = var.project_name
  location               = var.location
  resource_group_name    = "rg-${var.project_name}-network"
  address_space_hub      = var.address_space_hub
  address_space_workload = var.address_space_workload
  tags                   = var.tags
}

module "monitoring" {
  source = "../../modules/monitoring"

  project_name        = var.project_name
  location            = var.location
  resource_group_name = "rg-${var.project_name}-network"
  tags                = var.tags
}


module "diagnostics" {
  source = "../../modules/diagnostics"

  workload_nsg_id            = module.networking.workload_nsg_id
  management_nsg_id          = module.networking.management_nsg_id
  log_analytics_workspace_id = module.monitoring.workspace_id
}

module "acr" {
  source = "../../modules/acr"

  name                = "shareqaepacr2026"
  resource_group_name = "rg-${var.project_name}-network"
  location            = var.location
  tags                = var.tags
}

module "aks" {
  source = "../../modules/aks"

  cluster_name        = "aks-aep-lab"
  location            = var.location
  resource_group_name = "rg-aep-lab-aks"
  dns_prefix          = "aks-aep-lab-dns"
  node_vm_size        = "Standard_D2s_v3"
  tags                = var.tags
}
