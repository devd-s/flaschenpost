provider "azurerm" {
  features {}
}

module "azure_storage" {
  source = "./modules/storage-account"

  resource_group_name      = "sre-challenge-flashenpost"
  department               = "SRE"
  container_name           = "sre"
#  account_tier             = "Standard" # can be customized based on the needs, default is Standard 
#  storage_account_name     = "srechallengeflasch" # customizing the name incase someone wants to do, default is srechallengeflaschenpost
#  container_access_type    = "blob" # can be customized based on the needs, default is private
#  location                 = "uksouth" # customizing the location incase someone wants to do
#  replication_type         = "GRS" # can be customized based on the needs, default is LRS 
#  access_tier              = "Hot" # can be customized based on the needs, default is HOT 
}
