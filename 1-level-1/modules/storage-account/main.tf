terraform {
  required_version = ">= 1.0.0"

  # Required providers, if any, can also be specified here
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0.0"  #  azurerm version constraint
    }
  }
}


# Create Azure Resource Group
resource "azurerm_resource_group" "sre_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    department = var.department
  }
}

# Create Azure Storage Account
resource "azurerm_storage_account" "sre_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.sre_rg.name
  location                 = azurerm_resource_group.sre_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  access_tier              = var.access_tier

  tags = {
    department = var.department
  }
}

# Create Storage Account Container
resource "azurerm_storage_container" "sre_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sre_storage.name
  container_access_type = var.container_access_type
}
