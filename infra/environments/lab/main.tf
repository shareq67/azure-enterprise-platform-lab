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
