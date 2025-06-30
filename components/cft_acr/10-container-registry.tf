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
  anonymous_pull_enabled   = try(each.value.anonymous_pull_enabled, null)
  sku                      = each.value.sku
  retention_policy_in_days = 1
  tags                     = module.tags.common_tags
}

resource "azurerm_container_registry_replication" "replica" {
  for_each = {
    for acr_name, acr in var.cft_acr : 
    acr_name => acr.geo_replication_locations
    if contains(keys(acr), "geo_replication_locations")
  }

  name                    = "${each.key}-replica"
  location                = each.value[0].location
  resource_group_name     = azurerm_resource_group.cft_acr_resource_group.name
  registry_name           = azurerm_container_registry.container_registry[each.key].name
  zone_redundancy_enabled = try(each.value[0].zone_redundancy_enabled, null)
  tags                    = module.tags.common_tags
}
