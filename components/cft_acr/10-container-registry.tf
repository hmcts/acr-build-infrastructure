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

  georeplications {
    location                = each.value.location
    zone_redundancy_enabled = each.value.zone_redundancy_enabled
    tags                    = module.tags.common_tags
  }
}