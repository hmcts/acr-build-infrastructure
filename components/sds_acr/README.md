<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version   |
| ------------------------------------------------------------------------ | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0  |
| <a name="requirement_azuread"></a> [azuread](#requirement_azuread)       | ~> 3.3.0  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm)       | ~> 4.27.0 |

## Providers

| Name                                                         | Version   |
| ------------------------------------------------------------ | --------- |
| <a name="provider_azuread"></a> [azuread](#provider_azuread) | ~> 3.3.0  |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | ~> 4.27.0 |

## Modules

| Name                                            | Source                                                         | Version |
| ----------------------------------------------- | -------------------------------------------------------------- | ------- |
| <a name="module_tags"></a> [tags](#module_tags) | git::https://github.com/hmcts/terraform-module-common-tags.git | master  |

## Resources

| Name                                                                                                                                                | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [azurerm_container_registry.container_registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource    |
| [azurerm_resource_group.sds_acr_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)     | resource    |
| [azurerm_role_assignment.acr_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment)               | resource    |
| [azurerm_role_assignment.sds_acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment)                  | resource    |
| [azuread_group.acr](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group)                                       | data source |

## Inputs

| Name                                                                                                   | Description                | Type                                                                                                                                                                                                                                                                                                                  | Default        | Required |
| ------------------------------------------------------------------------------------------------------ | -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | :------: |
| <a name="input_builtFrom"></a> [builtFrom](#input_builtFrom)                                           | n/a                        | `any`                                                                                                                                                                                                                                                                                                                 | n/a            |   yes    |
| <a name="input_env"></a> [env](#input_env)                                                             | General                    | `any`                                                                                                                                                                                                                                                                                                                 | n/a            |   yes    |
| <a name="input_expiresAfter"></a> [expiresAfter](#input_expiresAfter)                                  | n/a                        | `string`                                                                                                                                                                                                                                                                                                              | `"3000-01-01"` |    no    |
| <a name="input_location"></a> [location](#input_location)                                              | n/a                        | `string`                                                                                                                                                                                                                                                                                                              | `"uksouth"`    |    no    |
| <a name="input_product"></a> [product](#input_product)                                                 | n/a                        | `any`                                                                                                                                                                                                                                                                                                                 | n/a            |   yes    |
| <a name="input_sds_acr"></a> [sds_acr](#input_sds_acr)                                                 | SDS ACR to be created      | <pre>map(object({<br/> sku = string<br/> admin_enabled = bool<br/> anonymous_pull_enabled = optional(bool, false)<br/> role_assignments = optional(map(object({<br/> principal_id = string<br/> role_definition_name = string<br/> principal_type = optional(string, "ServicePrincipal")<br/> })), {})<br/> }))</pre> | n/a            |   yes    |
| <a name="input_sds_resource_group_name"></a> [sds_resource_group_name](#input_sds_resource_group_name) | Name of the resource group | `string`                                                                                                                                                                                                                                                                                                              | `"sds-acr-rg"` |    no    |
| <a name="input_sds_subscription_id"></a> [sds_subscription_id](#input_sds_subscription_id)             | Subscription ID for SDS    | `string`                                                                                                                                                                                                                                                                                                              | n/a            |   yes    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
