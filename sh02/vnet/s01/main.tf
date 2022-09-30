terraform {
  backend "azurerm" {
    key = "vnet/s01.tfstate"
  }

  required_version = "1.0.11"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.99.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "git@github.com:praveen2391/humana-terraform-modules.git//resourcegroup"
  location = var.location
  project = var.project
  lob = var.lob
  zone = var.zone
}

module "vnet" {
  source = "git@github.com:praveen2391/humana-terraform-modules.git//virtualnetwork"
  location = var.location
  project = var.project
  lob = var.lob
  zone = var.zone
  resource_group_name = module.resource_group.name
  address_space = var.address_space
  dns_servers = var.dns_servers
  law_id = data.terraform_remote_state.log.outputs.law_id
}