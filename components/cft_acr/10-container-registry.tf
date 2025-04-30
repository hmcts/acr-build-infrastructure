resource "azurerm_resource_group" "cft_acr_resource_group" {
  location = var.location
  name     = var.cft_resource_group_name
  tags     = module.tags.common_tags
}
data "azuread_group" "acr" {
  display_name = "DTS ACR Access Administrators"
}

resource "azurerm_role_assignment" "acr_access" {
  scope                = azurerm_resource_group.cft_acr_resource_group.id
  role_definition_name = "User Access Administrator"
  principal_id         = data.azuread_group.acr.object_id
}

#--------------------------------------------------------------
# CFT Azure Container Registries
#--------------------------------------------------------------

resource "azurerm_container_registry" "container_registry" {
  for_each = var.cft_acr

  name                     = each.key
  resource_group_name      = azurerm_resource_group.cft_acr_resource_group.name
  location                 = var.location
  admin_enabled            = each.value.admin_enabled
  anonymous_pull_enabled   = each.value.anonymous_pull_enabled
  sku                      = each.value.sku
  retention_policy_in_days = 1
  tags                     = module.tags.common_tags
}


import {
  for_each = { for key, value in var.cft_acr : key => value if var.env == "prod" }

  to = azurerm_container_registry.container_registry[each.key]
  id = "/subscriptions/8999dec3-0104-4a27-94ee-6588559729d1/resourceGroups/rpe-acr-prod-rg/providers/Microsoft.ContainerRegistry/registries/${each.key}"
}

import {
  for_each = { for key, value in var.cft_acr : key => value if var.env == "sbox" }

  to = azurerm_container_registry.container_registry[each.key]
  id = "/subscriptions/bf308a5c-0624-4334-8ff8-8dca9fd43783/resourceGroups/cnp-acr-rg/providers/Microsoft.ContainerRegistry/registries/${each.key}"
}

import {
  to = azurerm_resource_group.cft_acr_resource_group
  id = "/subscriptions/${var.cft_subscription_id}/resourceGroups/${var.cft_resource_group_name}"
}

locals {
  import_map = {
    key = "value"
  }
}

import {
  for_each = { for key, value in local.import_map : key => value if var.env == "prod" }

  to = azurerm_role_assignment.acr_access
  id = "/subscriptions/${var.cft_subscription_id}/resourceGroups/${var.cft_resource_group_name}/providers/Microsoft.Authorization/roleAssignments/d79932bc-2f3b-49ca-b975-f36cf806e912"
}
