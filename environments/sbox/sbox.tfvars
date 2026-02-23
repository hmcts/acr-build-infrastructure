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
    sku                     = "Premium"
    admin_enabled           = true
    enable_managed_identity = true
    # Grant Jenkins MI the ability to use the ACR's managed identity
    # This allows ACR Tasks run by Jenkins to authenticate to other registries (like hmctsprod)
    identity_role_assignments = {
      "jenkins-ptl-mi-identity-operator" = {
        principal_id         = "7ef3b6ce-3974-41ab-8512-c3ef4bb8ae01"
        role_definition_name = "Managed Identity Operator"
      },
      "jenkins-cftptl-intsvc-mi-operator" = {
        principal_id         = "ca6d5085-485a-417d-8480-c3cefa29df31"
        role_definition_name = "Managed Identity Operator"
      },
    }
    role_assignments = {
      "hmctssbox-identity-contributor" = {
        principal_id         = "7dee46ea-9b5b-4ce0-893d-56bd3619e270"
        role_definition_name = "Contributor"
      },
      "cft-aks-sbox-mi-pull" = {
        principal_id         = "ff47ab8f-e4d9-48f2-ad31-af5933824849"
        role_definition_name = "AcrPull"
      },
      "sds-aks-sbox-mi-pull" = {
        principal_id         = "ba206872-8722-4375-bf4d-a28c39dff414"
        role_definition_name = "AcrPull"
      },
      "jenkins-cftptl-intsvc-mi-contributor" = {
        principal_id         = "ca6d5085-485a-417d-8480-c3cefa29df31"
        role_definition_name = "Contributor"
      },
      "aks-kubelet-ptl-mi-pull" = {
        principal_id         = "7a6762ce-8a4f-4496-b7e5-08ea2f55bbc4"
        role_definition_name = "AcrPull"
      },
      "aks-kubelet-sbox-mi-pull" = {
        principal_id         = "fd657beb-8e34-42f2-9cc7-f9016a065849"
        role_definition_name = "AcrPull"
      },
      "aks-kubelet-dev-mi-pull" = {
        principal_id         = "aa4fdc35-0cfd-4db0-a5b4-d17d0f4bf06a"
        role_definition_name = "AcrPull"
      },
      "aks-kubelet-stg-mi-pull" = {
        principal_id         = "be335440-0f13-4e3d-80c6-c5164257f0d9"
        role_definition_name = "AcrPull"
      },
      "cft-preview-01-aks-agentpool-pull" = {
        principal_id         = "f9778736-862f-4ea7-8ef5-9d15ae8f1743"
        role_definition_name = "AcrPull"
      },
      "jenkins-ptl-mi-contributor" = {
        principal_id         = "7ef3b6ce-3974-41ab-8512-c3ef4bb8ae01"
        role_definition_name = "Contributor"
      },
      "azure-devops-prod1-contributor" = {
        principal_id         = "0efd358e-36f0-4524-b90a-43247cccebf5"
        role_definition_name = "Contributor"
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

cache_rule_dockerhub_credentials = {
  key_vault_name       = "cftsbox-intsvc"
  key_vault_rg         = "core-infra-intsvc-rg"
  username_secret_name = "docker-hub-acr-cache-user"
  password_secret_name = "docker-hub-acr-cache-token"
}
