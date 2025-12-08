
# Lookup the Key Vault by name
data "azurerm_key_vault" "dockerhub" {
  name                = var.cache_rule_dockerhub_credentials["key_vault_name"]
  resource_group_name = var.cache_rule_dockerhub_credentials["key_vault_rg"]
}

# Lookup the username secret
data "azurerm_key_vault_secret" "dockerhub_username" {
  name         = var.cache_rule_dockerhub_credentials["username_secret_name"]
  key_vault_id = data.azurerm_key_vault.dockerhub.id
}

# Lookup the password secret
data "azurerm_key_vault_secret" "dockerhub_password" {
  name         = var.cache_rule_dockerhub_credentials["password_secret_name"]
  key_vault_id = data.azurerm_key_vault.dockerhub.id
}

resource "azurerm_container_registry_credential_set" "dockerhub" {
  name                  = "dockerhub"
  container_registry_id = azurerm_container_registry.example.id
  login_server          = "docker.io"
  identity {
    type = "SystemAssigned"
  }
  authentication_credentials {
    username_secret_id = data.azurerm_key_vault_secret.dockerhub_username.versionless_id
    password_secret_id = data.azurerm_key_vault_secret.dockerhub_password.versionless_id
  }
}
