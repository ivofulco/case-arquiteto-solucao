variable "prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "runtime" {
  description = "Runtime stack for the Azure Function"
  type        = string
  default     = "node"
}
