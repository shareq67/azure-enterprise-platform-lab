variable "subscription_id" {
  description = "Target Azure subscription ID. Keep it out of committed files."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Primary region."
  type        = string
  default     = "centralindia"
}

variable "project_name" {
  description = "Short project identifier."
  type        = string
  default     = "aep-lab"
}

variable "address_space_hub" {
  description = "Hub VNet CIDR; must not overlap with workload VNet or any connected network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "address_space_workload" {
  description = "Workload VNet CIDR; must not overlap with hub or future connected networks."
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "tags" {
  type = map(string)

  default = {
    Project     = "AzureEnterprisePlatformLab"
    Environment = "Lab"
    ManagedBy   = "Terraform"
    Purpose     = "Learning"
    Creator     = "Shareque"
  }
}