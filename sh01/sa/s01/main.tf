terraform {
  required_version = "1.0.11"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.99.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "git@github.com:praveen2391/humana-terraform-modules.git//resourcegroup"
  location = var.location
  project  = var.project
  lob      = var.lob
  zone     = var.zone
}

# storage account module created for storing the state file for all other resources
module "storage_account" {
  source                   = "git@github.com:praveen2391/humana-terraform-modules.git//storageaccount"
  location                 = module.resource_group.resource_group_location
  resource_group_name      = module.resource_group.resource_group_name
  account_replication_type = "GRS"
  account_tier             = "Standard"
}

module "storage_account_container" {
  source               = "git@github.com:praveen2391/humana-terraform-modules.git//storageaccountcontainer"
  container_name       = var.storage_account_container_name
  storage_account_name = module.storage_account.name
}