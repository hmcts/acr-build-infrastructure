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

variable "cft_resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "cft_subscription_id" {
  description = "Subscription ID"
  type        = string
}

variable "cft_acr" {
  description = "CFT ACR to be created"
  type = map(object({
    sku                    = string
    admin_enabled          = bool
    anonymous_pull_enabled = optional(bool, false)
    georeplications = optional(list(object({
      location                = string
      zone_redundancy_enabled = optional(bool)
    })), [])
  }))
}
