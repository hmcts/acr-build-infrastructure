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
