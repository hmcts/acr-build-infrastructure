terraform {
  required_version = ">= 1.0.0"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.61.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.6.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

provider "azurerm" {
  alias                      = "hmcts-control"
  skip_provider_registration = "true"
  features {}
  subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
}