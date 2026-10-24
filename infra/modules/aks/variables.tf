
variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for AKS"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
}

variable "node_vm_size" {
  description = "VM size for the AKS system node"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
