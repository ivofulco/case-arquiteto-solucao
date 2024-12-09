output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.cosmosdb.name
}

output "cosmosdb_database_name" {
  value = azurerm_cosmosdb_sql_database.cosmosdb_database.name
}

output "cosmosdb_container_name" {
  value = azurerm_cosmosdb_sql_container.cosmosdb_container.name
}

output "cosmosdb_endpoint" {
  value = azurerm_cosmosdb_account.cosmosdb.endpoint
}
