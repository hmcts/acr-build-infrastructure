resource "azurerm_resource_group" "sds_acr_resource_group" {
  location = var.location
  name     = var.sds_resource_group_name
  tags     = module.tags.common_tags
}
data "azuread_group" "acr" {
  display_name = "DTS ACR Access Administrators"
}

resource "azurerm_role_assignment" "acr_access" {
  scope                = azurerm_resource_group.sds_acr_resource_group.id
  role_definition_name = "User Access Administrator"
  principal_id         = data.azuread_group.acr.object_id
}

#--------------------------------------------------------------
# SDS Azure Container Registries
#--------------------------------------------------------------

resource "azurerm_container_registry" "container_registry" {
  for_each = var.sds_acr

  name                     = each.key
  resource_group_name      = azurerm_resource_group.sds_acr_resource_group.name
  location                 = var.location
  admin_enabled            = each.value.admin_enabled
  sku                      = each.value.sku
  retention_policy_in_days = 1
  tags                     = module.tags.common_tags
}

import {
  for_each = { for key, value in var.sds_acr : key => value if var.env == "prod" }

  to = azurerm_container_registry.container_registry[each.key]
  id = "/subscriptions/5ca62022-6aa2-4cee-aaa7-e7536c8d566c/resourceGroups/${var.sds_resource_group_name}/providers/Microsoft.ContainerRegistry/registries/${each.key}"
}

import {
  for_each = { for key, value in var.sds_acr : key => value if var.env == "sbox" }

  to = azurerm_container_registry.container_registry[each.key]
  id = "/subscriptions/a8140a9e-f1b0-481f-a4de-09e2ee23f7ab/resourceGroups/${var.sds_resource_group_name}/providers/Microsoft.ContainerRegistry/registries/${each.key}"
}

import {
  to = azurerm_resource_group.sds_acr_resource_group
  id = "/subscriptions/${var.sds_subscription_id}/resourceGroups/${var.sds_resource_group_name}"
}

import {
  to = azurerm_role_assignment.acr_access
  id = "/subscriptions/${var.sds_subscription_id}/resourceGroups/${var.sds_resource_group_name}/providers/Microsoft.Authorization/roleAssignments/${var.sds_role_assignment_id}"
}
