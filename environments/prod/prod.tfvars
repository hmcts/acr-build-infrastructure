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
        principal_id         = "b3b7ba91-dadc-40ca-831a-a3d5adeb367c"
        role_definition_name = "AcrPull"
      },
      "cft-aks-aat-mi-pull" = {
        principal_id         = "9a2e3549-c5aa-4f7b-bcf8-1e1b3baf864c"
        role_definition_name = "AcrPull"
      },
      "cft-aks-demo-mi-pull" = {
        principal_id         = "a16e4c77-50e4-467f-9a3f-6b5f809b271d"
        role_definition_name = "AcrPull"
      },
      "cft-aks-ithc-mi-pull" = {
        principal_id         = "fcf1fd52-1e62-4827-b8f7-7088bc9dd488"
        role_definition_name = "AcrPull"
      },
      "cft-aks-perftest-mi-pull" = {
        principal_id         = "396e0bf7-3416-4f89-b2f3-a2dfc9c53fa2"
        role_definition_name = "AcrPull"
      },
      "cft-aks-preview-mi-pull" = {
        principal_id         = "916381c3-3565-4fa9-80bc-1e7754942106"
        role_definition_name = "AcrPull"
      },
      "cft-aks-prod-mi-pull" = {
        principal_id         = "718712f6-94f0-4014-b7f7-c8a0ce967894"
        role_definition_name = "AcrPull"
      },
      "cft-aks-ptl-intsvc-mi-pull" = {
        principal_id         = "8670dd40-c5ab-4877-bdb3-64e4e1ade6b9"
        role_definition_name = "AcrPull"
      },
      "cft-aks-sbox-intsvc-mi-pull" = {
        principal_id         = "47029ea9-8c0b-48e7-a2dc-ae43f2ba1833"
        role_definition_name = "AcrPull"
      }
      "cft-aks-sbox-mi-pull" = {
        principal_id         = "ff47ab8f-e4d9-48f2-ad31-af5933824849"
        role_definition_name = "AcrPull"
      },
    }
  }
}

cache_rule_dockerhub_credentials ={
  key_vault_name        = "cftptl-intsvc"
  key_vault_rg          = "core-infra-intsvc-rg"
  username_secret_name  = "docker-hub-acr-cache-user"
  password_secret_name  = "docker-hub-acr-cache-token"
}
