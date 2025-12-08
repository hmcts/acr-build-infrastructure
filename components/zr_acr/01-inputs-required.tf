# General
variable "env" {}

variable "product" {}

variable "builtFrom" {}

variable "location" {
  default = "uksouth"
}

variable "expiresAfter" {
  default = "3000-01-01"
}

variable "zr_resource_group_name" {
  description = "Name of the resource group for zone-redundant ACRs"
  type        = string
}

variable "zr_subscription_id" {
  description = "Subscription ID for zone-redundant ACRs"
  type        = string
}

variable "cache_rule_dockerhub_credentials" {
  description = "Key Vault and secret names for Docker Hub credentials used by ACR Tasks with cache rules."
  type = object({
    key_vault_name        = string
    key_vault_rg          = string
    username_secret_name  = string
    password_secret_name  = string
  })
}

variable "zr_acr" {
  description = "Zone-redundant ACRs to be created"
  type = map(object({
    sku                    = string
    admin_enabled          = bool
    anonymous_pull_enabled = optional(bool, false)
  }))
}
