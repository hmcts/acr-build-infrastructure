terraform {
  required_version = ">= 1.0.0"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.62.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.env == "prod" ? "5ca62022-6aa2-4cee-aaa7-e7536c8d566c" : "a8140a9e-f1b0-481f-a4de-09e2ee23f7ab"
}

provider "azuread" {}

