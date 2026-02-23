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
  anonymous_pull_enabled   = each.value.anonymous_pull_enabled
  sku                      = each.value.sku
  retention_policy_in_days = 1
  tags                     = module.tags.common_tags
}

resource "azurerm_role_assignment" "sds_acr" {
  for_each = merge([
    for acr_name, acr_config in var.sds_acr : {
      for role_key, role_config in acr_config.role_assignments :
      "${acr_name}-${role_key}" => {
        acr_name             = acr_name
        principal_id         = role_config.principal_id
        role_definition_name = role_config.role_definition_name
        principal_type       = role_config.principal_type
      }
    }
  ]...)

  scope                = azurerm_container_registry.container_registry[each.value.acr_name].id
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.principal_id
  principal_type       = each.value.principal_type
}
