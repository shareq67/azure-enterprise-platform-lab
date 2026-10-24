
resource "azurerm_monitor_diagnostic_setting" "workload_nsg" {
  name                       = "diag-nsg-workload"
  target_resource_id         = var.workload_nsg_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "NetworkSecurityGroupRuleCounter"
  }
}

resource "azurerm_monitor_diagnostic_setting" "management_nsg" {
  name                       = "diag-nsg-management"
  target_resource_id         = var.management_nsg_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "NetworkSecurityGroupRuleCounter"
  }
}
