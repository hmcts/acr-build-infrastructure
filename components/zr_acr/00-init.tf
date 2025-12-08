terraform {
  required_version = ">= 1.0.0"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.27.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.env == "prod" ? "8999dec3-0104-4a27-94ee-6588559729d1" : "bf308a5c-0624-4334-8ff8-8dca9fd43783"
}

provider "azuread" {}

provider "azurerm" {
  alias           = "keyvault"
  features {}
  subscription_id = var.env == "prod" ? "1baf5470-1c3e-40d3-a6f7-74bfbce4b348" : "1497c3d7-ab6d-4bb7-8a10-b51d03189ee3"
}
