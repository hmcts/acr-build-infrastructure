# Role assignment created manually on 2026-01-19, before it was added to sbox.tfvars.
# Remove once applied.
import {
  for_each = var.env == "sbox" ? toset(["hmctssbox-sds-jenkins-ptlsbox-mi-pull"]) : toset([])
  to       = azurerm_role_assignment.zr_acr[each.key]
  id       = "/subscriptions/bf308a5c-0624-4334-8ff8-8dca9fd43783/resourceGroups/cnp-acr-rg/providers/Microsoft.ContainerRegistry/registries/hmctssbox/providers/Microsoft.Authorization/roleAssignments/320a8f60-3288-4fd2-a25e-a43169d23aad"
}