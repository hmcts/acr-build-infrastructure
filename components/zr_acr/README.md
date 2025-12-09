# Zone-Redundant Azure Container Registry Component

This component manages zone-redundant Azure Container Registries (ACRs).

## Features

- Zone redundancy enabled by default
- Requires Premium SKU (zone redundancy is only supported on Premium)

## Usage

Add ACR configuration to the appropriate environment tfvars file:

```hcl
zr_resource_group_name = "cnp-acr-zr-rg"
zr_subscription_id     = "test"

zr_acr = {
  hmctssbox = {
    sku           = "Premium"
  }
}
```

Zone redundancy is automatically enabled for all ACRs in this component.

## Optional Role Assignments

You can optionally assign roles to principals for specific ZR ACRs by adding role_assignments to each ACR:

```hcl
zr_acr = {
  hmctssbox = {
    sku           = "Premium"
    admin_enabled = false
    role_assignments = {
      "push-role" = {
        principal_id         = "<object_id_of_principal>"
        role_definition_name = "AcrPush"
      }
      "pull-role" = {
        principal_id         = "<another_object_id>"
        role_definition_name = "AcrPull"
      }
    }
  }
}
```

Omit or leave `role_assignments` empty to skip role assignments for an ACR.
