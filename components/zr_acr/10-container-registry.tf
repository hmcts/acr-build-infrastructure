# To be made a resource after we get to removing old ACRs using tf move
data "azurerm_resource_group" "zr_acr_resource_group" {
  name = var.zr_resource_group_name
}

#--------------------------------------------------------------
# Zone-Redundant Azure Container Registries
#--------------------------------------------------------------

resource "azurerm_user_assigned_identity" "acr_identity" {
  for_each = { for k, v in var.zr_acr : k => v if v.enable_managed_identity }

  name                = "${each.key}-identity"
  resource_group_name = data.azurerm_resource_group.zr_acr_resource_group.name
  location            = data.azurerm_resource_group.zr_acr_resource_group.location
  tags                = module.tags.common_tags
}

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

  dynamic "identity" {
    for_each = each.value.enable_managed_identity ? [1] : []
    content {
      type = "UserAssigned"
      identity_ids = [
        azurerm_user_assigned_identity.acr_identity[each.key].id
      ]
    }
  }
}

# Optional role assignments for ZR ACRs
resource "azurerm_role_assignment" "zr_acr" {
  for_each = merge([
    for acr_name, acr_config in var.zr_acr : {
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
