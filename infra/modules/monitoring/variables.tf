
variable "project_name" {
  description = "Project identifier."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the monitoring workspace."
  type        = string
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
}
