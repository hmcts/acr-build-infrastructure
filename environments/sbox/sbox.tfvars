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
        principal_id         = "ff47ab8f-e4d9-48f2-ad31-af5933824849"
        role_definition_name = "AcrPull"
      },
      "sds-aks-sbox-mi-pull" = {
        principal_id         = "ba206872-8722-4375-bf4d-a28c39dff414"
        role_definition_name = "AcrPull"
      },
      "jenkins-cftptl-intsvc-mi" = {
        principal_id         = "ca6d5085-485a-417d-8480-c3cefa29df31"
        role_definition_name = "AcrPull"
      },
      "aks-kubelet-ptl-mi" = {
        principal_id         = "7a6762ce-8a4f-4496-b7e5-08ea2f55bbc4"
        role_definition_name = "AcrPull"
      },
      "aks-kubelet-sbox-mi" = {
        principal_id         = "fd657beb-8e34-42f2-9cc7-f9016a065849"
        role_definition_name = "AcrPull"
      },
      "cft-developers" = {
        principal_id         = "b2a1773c-a5ae-48b5-b5fa-95b0e05eee05"
        role_definition_name = "AcrPull"
        principal_type       = "Group"
      },
      "sds-developers" = {
        principal_id         = "7bde62e7-b39f-487c-95c9-b4c794fdbb96"
        role_definition_name = "AcrPull"
        principal_type       = "Group"
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
