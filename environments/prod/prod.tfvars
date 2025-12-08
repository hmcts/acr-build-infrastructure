cft_subscription_id     = "8999dec3-0104-4a27-94ee-6588559729d1"
cft_resource_group_name = "rpe-acr-prod-rg"

cft_acr = {
  hmctspublic = {
    sku                    = "Premium"
    admin_enabled          = true
    anonymous_pull_enabled = true
  }

  hmctsprivate = {
    sku           = "Premium"
    admin_enabled = true
  }
}

sds_subscription_id = "5ca62022-6aa2-4cee-aaa7-e7536c8d566c"

sds_acr = {
  sdshmctspublic = {
    sku                    = "Premium"
    admin_enabled          = true
    anonymous_pull_enabled = true
  }
}

zr_subscription_id     = "8999dec3-0104-4a27-94ee-6588559729d1"
zr_resource_group_name = "rpe-acr-prod-rg"

zr_acr = {
  hmctsprod = {
    sku           = "Premium"
    admin_enabled = true
  }
}

cache_rule_dockerhub_credentials ={
  key_vault_name        = "cftptl-intsvc"
  key_vault_rg          = "core-infra-intsvc-rg"
  username_secret_name  = "docker-hub-acr-cache-user"
  password_secret_name  = "docker-hub-acr-cache-token"
}
