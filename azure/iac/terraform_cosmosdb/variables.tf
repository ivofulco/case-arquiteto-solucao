variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "cosmosdb_account_name" {
  description = "Name of the Cosmos DB account"
  type        = string
}

variable "database_name" {
  description = "Name of the Cosmos DB SQL database"
  type        = string
}

variable "container_name" {
  description = "Name of the Cosmos DB container"
  type        = string
}

variable "partition_key_paths" {
  description = "Partition key path for the Cosmos DB container"
  type        = string
}

variable "container_throughput" {
  description = "Provisioned throughput for the container (RU/s)"
  type        = number
  default     = 400
}

variable "consistency_level" {
  description = "Consistency level for the Cosmos DB account"
  type        = string
  default     = "Session"
}

variable "max_interval_in_seconds" {
  description = "Max interval for bounded staleness consistency (seconds)"
  type        = number
  default     = 5
}

variable "max_staleness_prefix" {
  description = "Max staleness prefix for bounded staleness consistency"
  type        = number
  default     = 100
}
