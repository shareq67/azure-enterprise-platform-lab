variable "project_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "address_space_hub" {
  type = list(string)
}

variable "address_space_workload" {
  type = list(string)
}

variable "tags" {
  type = map(string)

  default = {
    Creator = "Shareque"
  }
}
