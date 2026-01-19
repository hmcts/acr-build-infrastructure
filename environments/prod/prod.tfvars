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
      # CFT AKS Source Controller Identities
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
      # SDS AKS Source Controller Identities
      "sds-aks-demo-mi-pull" = {
        principal_id         = "da1811ab-7eb9-4dbb-92eb-ad0e2e475ffe"
        role_definition_name = "AcrPull"
      },
      "sds-aks-dev-mi-pull" = {
        principal_id         = "6c5fded7-1350-4d99-b404-8f57d0025643"
        role_definition_name = "AcrPull"
      },
      "sds-aks-ithc-mi-pull" = {
        principal_id         = "6cc10170-e033-4e13-ba3c-0d3fff52d182"
        role_definition_name = "AcrPull"
      },
      "sds-aks-prod-mi-pull" = {
        principal_id         = "9fa9a7a7-f4d8-4731-9dca-2dd264836bf9"
        role_definition_name = "AcrPull"
      },
      "sds-aks-ptl-mi-pull" = {
        principal_id         = "6ad917c2-3739-4b6d-98b6-d9f45462f440"
        role_definition_name = "AcrPull"
      },
      "sds-aks-ptlsbox-mi-pull" = {
        principal_id         = "d864b3ca-238c-474a-a426-6e526207cf4a"
        role_definition_name = "AcrPull"
      },
      "sds-aks-stg-mi-pull" = {
        principal_id         = "1f42d5fd-e934-43b3-b55c-cdb2e7cf44eb"
        role_definition_name = "AcrPull"
      },
      "sds-aks-test-mi-pull" = {
        principal_id         = "b24bca5d-656e-4285-85a9-f69dd718a17e"
        role_definition_name = "AcrPull"
      },
      # AKS Kubelet Identities
      "aks-kubelet-ptl-mi-pull" = {
        principal_id         = "7a6762ce-8a4f-4496-b7e5-08ea2f55bbc4"
        role_definition_name = "AcrPull"
      },
      "aks-kubelet-ptlsbox-mi-pull" = {
        principal_id         = "434dc02a-5353-4ccc-9f26-c8bbf2105e7f"
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
      "aks-kubelet-demo-mi-pull" = {
        principal_id         = "4a8907ff-bf6f-4b5d-92d0-4a95e6882ef6"
        role_definition_name = "AcrPull"
      },
      "aks-kubelet-ithc-mi-pull" = {
        principal_id         = "58308c21-1a57-49eb-b2ba-f9507083425f"
        role_definition_name = "AcrPull"
      },
      "aks-kubelet-prod-mi-pull" = {
        principal_id         = "2bdafbb5-961b-4f0f-9de2-0e3a1f1ef8f5"
        role_definition_name = "AcrPull"
      },
      "aks-kubelet-test-mi-pull" = {
        principal_id         = "b5e9c5f4-9d7a-4156-a820-412fb3ac8c38"
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
