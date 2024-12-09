module "azure_function" {
  source               = "./terraform-azure-function"
  prefix               = "myfunction"
  resource_group_name  = "my-resource-group"
  location             = "East US"
  runtime              = "node"
}


module "cosmosdb" {
  source               = "./terraform-cosmosdb"
  resource_group_name  = "my-resource-group"
  location             = "East US"
  cosmosdb_account_name = "mycosmosdb"
  database_name         = "mydatabase"
  container_name        = "mycontainer"
  partition_key_paths    = "/partitionKey"
  container_throughput  = 400
}
