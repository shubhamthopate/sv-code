resource "azurerm_resource_group" "example" {
  name     = var.rgname
  location = var.rglocation
}

module "appinsight" {
  source                = "./modules/appinsight"
  appinsightname        = var.appinsightname 
  appinsightlocation    = var.appinsightlocation
  tag                   = var.tag

}

module "appserviceplan" {
  source                            ="./modules/appserviceplan"
  appserviceplan_name                = var.appserviceplan_name     
  appserviceplan_loaction            = var.appserviceplan_loaction 
  tagasp                             =var.tagasp
}

module "appservice"{
  source              = "./modules/appservice"
  appservice_name     =var.appservice_name
  service_id  = module.appserviceplan.serviceplan_id
  depends_on = [module.appserviceplan]
}