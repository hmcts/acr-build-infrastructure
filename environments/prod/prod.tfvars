cft_subscription_id     = "8999dec3-0104-4a27-94ee-6588559729d1"
cft_role_assignment_id  = "d79932bc-2f3b-49ca-b975-f36cf806e912"
cft_resource_group_name = "rpe-acr-prod-rg"

cft_acr = {
  hmctspublic = {
    sku           = "Premium"
    admin_enabled = true
  }

  hmctsprivate = {
    sku           = "Premium"
    admin_enabled = true
  }
}

sds_acr = {
  sdshmctspublic = {
    sku                    = "Premium"
    admin_enabled          = true
    anonymous_pull_enabled = true
  }
}
