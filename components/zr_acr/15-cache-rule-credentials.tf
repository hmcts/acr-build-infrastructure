
# Lookup the Key Vault by name
data "azurerm_key_vault" "dockerhub" {
  provider            = azurerm.keyvault
  name                = var.cache_rule_dockerhub_credentials["key_vault_name"]
  resource_group_name = var.cache_rule_dockerhub_credentials["key_vault_rg"]
}

# Lookup the username secret
data "azurerm_key_vault_secret" "dockerhub_username" {
  provider     = azurerm.keyvault
  name         = var.cache_rule_dockerhub_credentials["username_secret_name"]
  key_vault_id = data.azurerm_key_vault.dockerhub.id
}

# Lookup the password secret
data "azurerm_key_vault_secret" "dockerhub_password" {
  provider     = azurerm.keyvault
  name         = var.cache_rule_dockerhub_credentials["password_secret_name"]
  key_vault_id = data.azurerm_key_vault.dockerhub.id
}

resource "azurerm_container_registry_credential_set" "dockerhub" {
  for_each = var.zr_acr

  name                  = "dockerhub"
  container_registry_id = azurerm_container_registry.container_registry[each.key].id
  login_server          = "docker.io"

  identity {
    type = "SystemAssigned"
  }

  authentication_credentials {
    username_secret_id = data.azurerm_key_vault_secret.dockerhub_username.versionless_id
    password_secret_id = data.azurerm_key_vault_secret.dockerhub_password.versionless_id
  }
}

resource "azurerm_key_vault_access_policy" "acr_credential_read_secrets" {
  for_each           = var.zr_acr
  provider           = azurerm.keyvault

  key_vault_id       = data.azurerm_key_vault.dockerhub.id
  tenant_id          = azurerm_container_registry_credential_set.dockerhub[each.key].identity[0].tenant_id
  object_id          = azurerm_container_registry_credential_set.dockerhub[each.key].identity[0].principal_id
  secret_permissions = ["Get", "List"]
}
