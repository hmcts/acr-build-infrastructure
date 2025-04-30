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

variable "sds_resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "sds-acr-rg"
}

variable "sds_subscription_id" {
  description = "Subscription ID for SDS"
  type        = string
}

variable "sds_role_assignment_id" {
  description = "Role assignment ID for SDS"
  type        = string
}

variable "sds_acr" {
  description = "SDS ACR to be created"
  type = map(object({
    sku                    = string
    admin_enabled          = bool
    anonymous_pull_enabled = optional(bool, false)
  }))
}
