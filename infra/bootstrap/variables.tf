variable "subscription_id" {
  description = "Target Azure subscription ID. Supply locally or via ARM_SUBSCRIPTION_ID; do not commit it."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region for the state resource group and storage account."
  type        = string
  default     = "centralindia"
}

variable "project_name" {
  description = "Short project identifier used in names."
  type        = string
  default     = "aep-lab"
}

variable "state_storage_account_name" {
  description = "Globally unique Azure Storage Account name: 3-24 lowercase letters/numbers."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.state_storage_account_name))
    error_message = "Storage account name must contain 3-24 lowercase letters/numbers only."
  }
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default = {
    Project     = "AzureEnterprisePlatformLab"
    Environment = "Lab"
    ManagedBy   = "Terraform"
    Purpose     = "Learning"
    Creator     = "Shareque"
  }
}
