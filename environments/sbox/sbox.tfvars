cft_subscription_id     = "bf308a5c-0624-4334-8ff8-8dca9fd43783"
cft_resource_group_name = "cnp-acr-rg"

cft_acr = {
  hmctssandbox = {
    sku           = "Premium"
    admin_enabled = true
  }
}

sds_subscription_id = "a8140a9e-f1b0-481f-a4de-09e2ee23f7ab"

sds_acr = {
  sdshmctspublicsbox = {
    sku           = "Premium"
    admin_enabled = true
  }
}

zr_subscription_id     = "bf308a5c-0624-4334-8ff8-8dca9fd43783"
zr_resource_group_name = "cnp-acr-rg"

zr_acr = {
  hmctssbox = {
    sku           = "Premium"
    admin_enabled = true
    role_assignments = {
      "cft-aks-sbox-mi-pull" = {
        principal_id         = "96775d73-e4f3-49ee-8bb6-f8660a19ba85"
        role_definition_name = "AcrPull"
      },
      "sds-aks-sbox-mi-pull" = {
        principal_id         = "09d99cb4-e1e7-49c2-a8e6-b5b1740e9c3b"
        role_definition_name = "AcrPull"
      }
    }
  }
}

cache_rule_dockerhub_credentials ={
  key_vault_name        = "cftsbox-intsvc"
  key_vault_rg          = "core-infra-intsvc-rg"
  username_secret_name  = "docker-hub-acr-cache-user"
  password_secret_name  = "docker-hub-acr-cache-token"
}
