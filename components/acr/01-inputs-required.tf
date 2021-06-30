# General
variable "env" {}

variable "project" {
  default = "sds"
}
variable "enable_debug" {}

variable "control_vault" {}

variable "subscription_id" {}

variable "product" {}

variable "builtFrom" {}

variable "location" {
  default = "uksouth"
}