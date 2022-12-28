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