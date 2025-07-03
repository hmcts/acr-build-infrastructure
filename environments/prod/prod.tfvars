cft_subscription_id     = "8999dec3-0104-4a27-94ee-6588559729d1"
cft_resource_group_name = "rpe-acr-prod-rg"

cft_acr = {
  hmctspublic = {
    sku                    = "Premium"
    admin_enabled          = true
    anonymous_pull_enabled = true
    georeplications = [
      {
        location                = "ukwest"
        zone_redundancy_enabled = false
      }
    ]
  }
}

hmctsprivate = {
  sku           = "Premium"
  admin_enabled = true
  georeplications = [
    {
      location                = "ukwest"
      zone_redundancy_enabled = false
    }
  ]
}

sds_subscription_id = "5ca62022-6aa2-4cee-aaa7-e7536c8d566c"

sds_acr = {
  sdshmctspublic = {
    sku                    = "Premium"
    admin_enabled          = true
    anonymous_pull_enabled = true
  }
}