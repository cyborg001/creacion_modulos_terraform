provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
 
}

terraform {
  backend "azurerm" {
    storage_account_name = "azuredevops2063553918"
    container_name       = "azuredevops"
    key                  = "key1"
    access_key           = "OSa/VyKDInXJRKjzpmwDg5z9ruNqnPneBDp1c+5moEcITaErSgMZteiybLa9LZWiAJ4Kq0yoHJ3h+ASt88G7JQ=="
  } 
}
locals{
  tags = {
    tier                 = "${var.tier}"
    deployment           = "${var.deployment}"
  }
}


# module "resource_group" {
#   source               = "C://Users/DELL/creacion_terraform/creacion_modulos_terraform/terraform/modules/resource_group"
#   resource_group       = "${var.resource_group}"
#   location             = "${var.location}"
# }
module "app_service" {
  source               = "C://Users/DELL/creacion_terraform/creacion_modulos_terraform/terraform/modules/appservice"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
  resource_type        = "AppService"
  application_type     = "${var.application_type}"
  tags                 = "${local.tags}"
}
# Reference the AppService Module here.
