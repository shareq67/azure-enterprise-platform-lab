
variable "workload_nsg_id" {
  description = "Resource ID of the workload Network Security Group"
  type        = string
}

variable "management_nsg_id" {
  description = "Resource ID of the management Network Security Group"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics workspace"
  type        = string
}
