provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "cosmosdb_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = var.cosmosdb_account_name
  location            = azurerm_resource_group.cosmosdb_rg.location
  resource_group_name = azurerm_resource_group.cosmosdb_rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix    = var.max_staleness_prefix
  }

  geo_location {
    location          = azurerm_resource_group.cosmosdb_rg.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmosdb_database" {
  name                = var.database_name
  resource_group_name = azurerm_resource_group.cosmosdb_rg.name
  account_name        = azurerm_cosmosdb_account.cosmosdb.name
}

resource "azurerm_cosmosdb_sql_container" "cosmosdb_container" {
  name                = var.container_name
  resource_group_name = azurerm_resource_group.cosmosdb_rg.name
  account_name        = azurerm_cosmosdb_account.cosmosdb.name
  database_name       = azurerm_cosmosdb_sql_database.cosmosdb_database.name
  partition_key_paths  = var.partition_key_paths

  throughput = var.container_throughput
}
