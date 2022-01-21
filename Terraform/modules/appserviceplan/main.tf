resource "azurerm_app_service_plan" "example" {
  name                = var.appserviceplan_name     
  location            = var.appserviceplan_loaction 
  resource_group_name = "rg-ads-dev-001"  
  kind             ="linux"
  reserved         =true
  sku {
    tier = "Standard"
    size = "S1"
  }
  tags                  = var.tagasp                
}