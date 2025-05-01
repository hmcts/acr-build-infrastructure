<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 3.3.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.27.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | git::https://github.com/hmcts/terraform-module-common-tags.git | master |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.container_registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_resource_group.cft_acr_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.acr_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azuread_group.acr](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_builtFrom"></a> [builtFrom](#input\_builtFrom) | n/a | `any` | n/a | yes |
| <a name="input_cft_acr"></a> [cft\_acr](#input\_cft\_acr) | CFT ACR to be created | <pre>map(object({<br/>    sku                    = string<br/>    admin_enabled          = bool<br/>    anonymous_pull_enabled = optional(bool, false)<br/>  }))</pre> | n/a | yes |
| <a name="input_cft_resource_group_name"></a> [cft\_resource\_group\_name](#input\_cft\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_cft_subscription_id"></a> [cft\_subscription\_id](#input\_cft\_subscription\_id) | Subscription ID | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | General | `any` | n/a | yes |
| <a name="input_expiresAfter"></a> [expiresAfter](#input\_expiresAfter) | n/a | `string` | `"3000-01-01"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"uksouth"` | no |
| <a name="input_product"></a> [product](#input\_product) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->