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

variable "zr_acr" {
  description = "Zone-redundant ACRs to be created"
  type = map(object({
    sku                    = string
    admin_enabled          = bool
    anonymous_pull_enabled = optional(bool, false)
  }))
}
