# AKS Azure Container Registry.
## Contains a pipeline for building public and private container registries using terraform code.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 1.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 2.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 1.6.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.61.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master |  |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.container_registry_private](https://registry.terraform.io/providers/hashicorp/azurerm/2.61.0/docs/resources/container_registry) | resource |
| [azurerm_container_registry.container_registry_public](https://registry.terraform.io/providers/hashicorp/azurerm/2.61.0/docs/resources/container_registry) | resource |
| [azurerm_resource_group.acr_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/2.61.0/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.acr_access](https://registry.terraform.io/providers/hashicorp/azurerm/2.61.0/docs/resources/role_assignment) | resource |
| [azuread_group.acr](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_builtFrom"></a> [builtFrom](#input\_builtFrom) | n/a | `any` | n/a | yes |
| <a name="input_control_vault"></a> [control\_vault](#input\_control\_vault) | n/a | `any` | n/a | yes |
| <a name="input_enable_debug"></a> [enable\_debug](#input\_enable\_debug) | n/a | `any` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | General | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"uksouth"` | no |
| <a name="input_product"></a> [product](#input\_product) | n/a | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | `"sds"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
