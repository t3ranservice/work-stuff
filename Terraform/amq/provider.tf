terraform {
  required_providers {
    azurerm = {
      source                  = "hashicorp/azurerm" 
      version                 = "3.48.0"
    }
  }
  backend "azurerm" {
    resource_group_name       = ""
    storage_account_name      = ""
    container_name            = ""
    key                       = ""
  }
}

provider "azurerm" {
  features {
  }
  subscription_id            = ""
}

provider "azurerm" {
  features {}
  alias                      = "golden_image"
  subscription_id            = ""
}

