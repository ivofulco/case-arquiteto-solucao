provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "function_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "function_storage" {
  name                     = lower(join("", [var.prefix, "storage"]))
  resource_group_name      = azurerm_resource_group.function_rg.name
  location                 = azurerm_resource_group.function_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "function_plan" {
  name                = lower(join("", [var.prefix, "plan"]))
  location            = azurerm_resource_group.function_rg.location
  resource_group_name = azurerm_resource_group.function_rg.name
  kind                = "FunctionApp"
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "function_app" {
  name                       = lower(join("", [var.prefix, "function"]))
  location                   = azurerm_resource_group.function_rg.location
  resource_group_name        = azurerm_resource_group.function_rg.name
  app_service_plan_id        = azurerm_app_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key
  version                    = "~4"
  os_type                    = "linux"

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = var.runtime
  }
}
