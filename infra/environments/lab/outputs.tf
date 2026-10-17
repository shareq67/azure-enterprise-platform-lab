output "resource_group_name" {
  value = module.networking.resource_group_name
}

output "hub_vnet_name" {
  value = module.networking.hub_vnet_name
}

output "workload_vnet_name" {
  value = module.networking.workload_vnet_name
}

output "hub_vnet_id" {
  value = module.networking.hub_vnet_id
}

output "workload_vnet_id" {
  value = module.networking.workload_vnet_id
}

output "subnet_ids" {
  value = module.networking.subnet_ids
}
