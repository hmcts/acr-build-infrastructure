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
    role_assignments = {
      "cft-developers" = {
        principal_id         = "b2a1773c-a5ae-48b5-b5fa-95b0e05eee05"
        role_definition_name = "AcrPull"
        principal_type       = "Group"
      },
      "sds-developers" = {
        principal_id         = "7bde62e7-b39f-487c-95c9-b4c794fdbb96"
        role_definition_name = "AcrPull"
        principal_type       = "Group"
      },
      "jenkins-ptl-mi-contributor" = {
        principal_id         = "7ef3b6ce-3974-41ab-8512-c3ef4bb8ae01"
        role_definition_name = "Contributor"
      },
      "hmctssbox-identity-pull" = {
        principal_id         = "7dee46ea-9b5b-4ce0-893d-56bd3619e270"
        role_definition_name = "AcrPull"
      },
      "renovate-pull" = {
        principal_id         = "831a6a68-6555-4467-b8ca-e80be0c04e31"
        role_definition_name = "AcrPull"
      }
    }
  }
}

cache_rule_dockerhub_credentials ={
  key_vault_name        = "cftptl-intsvc"
  key_vault_rg          = "core-infra-intsvc-rg"
  username_secret_name  = "docker-hub-acr-cache-user"
  password_secret_name  = "docker-hub-acr-cache-token"
}
