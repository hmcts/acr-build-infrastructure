module "tags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = lower(var.env)
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = "3000-01-01"
}
