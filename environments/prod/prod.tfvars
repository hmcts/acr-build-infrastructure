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
