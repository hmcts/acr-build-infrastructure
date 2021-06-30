resource "azurerm_resource_group" "acr_resource_group" {
  location = var.location
  name     = format("%s-acr-rg", var.project)
  tags     = module.tags.common_tags
}
data "azuread_group" "acr" {
  name = "DTS ACR Access Administrators"
}

resource "azurerm_role_assignment" "acr_access" {
  scope                = azurerm_resource_group.acr_resource_group.id
  role_definition_name = "User Access Administrator"
  principal_id         = data.azuread_group.acr.object_id
}

#--------------------------------------------------------------
# Public Azure Container Registry
#--------------------------------------------------------------

resource "azurerm_container_registry" "container_registry_public" {
  name                = format("%shmctspublic", var.project)
  resource_group_name = azurerm_resource_group.acr_resource_group.name
  location            = var.location
  admin_enabled       = "true"
  sku                 = "Premium"
  tags                = module.tags.common_tags

}

#--------------------------------------------------------------
# Private Azure Container Registry
#--------------------------------------------------------------

resource "azurerm_container_registry" "container_registry_private" {
  name                = format("%shmctsprivate", var.project)
  resource_group_name = azurerm_resource_group.acr_resource_group.name
  location            = var.location
  admin_enabled       = "true"
  sku                 = "Premium"

  tags = module.tags.common_tags

}
