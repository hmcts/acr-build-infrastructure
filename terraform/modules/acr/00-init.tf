terraform {
  required_version = ">= 0.12.0"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.31.1"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "~> 0.10"
    }
  }
}


variable "subscription_id" {}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "azuread" {}

provider "azurerm" {
  alias                      = "hmcts-control"
  skip_provider_registration = "true"
  features {}
  subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
}


