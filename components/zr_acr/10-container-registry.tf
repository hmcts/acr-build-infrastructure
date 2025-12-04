resource "azurerm_resource_group" "zr_acr_resource_group" {
  location = var.location
  name     = var.zr_resource_group_name
  tags     = module.tags.common_tags
}

data "azuread_group" "acr" {
  display_name = "DTS ACR Access Administrators"
}

resource "azurerm_role_assignment" "acr_access" {
  scope                = azurerm_resource_group.zr_acr_resource_group.id
  role_definition_name = "User Access Administrator"
  principal_id         = data.azuread_group.acr.object_id
}

#--------------------------------------------------------------
# Zone-Redundant Azure Container Registries
#--------------------------------------------------------------

resource "azurerm_container_registry" "container_registry" {
  for_each = var.zr_acr

  name                     = each.key
  resource_group_name      = azurerm_resource_group.zr_acr_resource_group.name
  location                 = var.location
  admin_enabled            = each.value.admin_enabled
  anonymous_pull_enabled   = each.value.anonymous_pull_enabled
  sku                      = each.value.sku
  zone_redundancy_enabled  = true
  retention_policy_in_days = 1
  tags                     = module.tags.common_tags
}
