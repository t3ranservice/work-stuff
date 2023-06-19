terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" 
      version = "3.53.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = ""
    storage_account_name  = ""
    container_name        = ""
    key                   = ""
  }
}

provider "azurerm" {
  features {}
}

