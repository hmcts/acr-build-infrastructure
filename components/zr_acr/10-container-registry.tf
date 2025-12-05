# To be made a resource after we get to removing old ACRs using tf move
data "azurerm_resource_group" "zr_acr_resource_group" {
  name = var.zr_resource_group_name
}

#--------------------------------------------------------------
# Zone-Redundant Azure Container Registries
#--------------------------------------------------------------

resource "azurerm_container_registry" "container_registry" {
  for_each = var.zr_acr

  name                     = each.key
  resource_group_name      = data.azurerm_resource_group.zr_acr_resource_group.name
  location                 = data.azurerm_resource_group.zr_acr_resource_group.location
  admin_enabled            = each.value.admin_enabled
  anonymous_pull_enabled   = each.value.anonymous_pull_enabled
  sku                      = each.value.sku
  zone_redundancy_enabled  = true
  retention_policy_in_days = 1
  tags                     = module.tags.common_tags
}

#--------------------------------------------------------------
# ACRPull Role Assignments for Developer Groups
#--------------------------------------------------------------

data "azuread_group" "cft_developers" {
  display_name = "DTS CFT Developers"
}

data "azuread_group" "sds_developers" {
  display_name = "DTS SDS Developers"
}

resource "azurerm_role_assignment" "cft_developers_acr_pull" {
  for_each = var.zr_acr

  scope                = azurerm_container_registry.container_registry[each.key].id
  role_definition_name = "AcrPull"
  principal_id         = data.azuread_group.cft_developers.object_id
}

resource "azurerm_role_assignment" "sds_developers_acr_pull" {
  for_each = var.zr_acr

  scope                = azurerm_container_registry.container_registry[each.key].id
  role_definition_name = "AcrPull"
  principal_id         = data.azuread_group.sds_developers.object_id
}
