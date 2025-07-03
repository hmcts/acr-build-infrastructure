resource "azurerm_resource_group" "cft_acr_resource_group" {
  location = var.location[0]
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
  location                 = var.location[0]
  admin_enabled            = each.value.admin_enabled
  anonymous_pull_enabled   = each.value.anonymous_pull_enabled
  sku                      = each.value.sku
  retention_policy_in_days = 1
  tags                     = module.tags.common_tags

  dynamic "georeplications" {
    for_each = lookup(each.value, "georeplications", [])
    content {
      location                = var.location[1]
      zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
      tags                    = {}
    }
  }
}

# output "hmctssandbox_georeplications" {
#   value = var.cft_acr["hmctssandbox"].georeplications
# }