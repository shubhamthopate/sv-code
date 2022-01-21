resource "azurerm_application_insights" "example" {
  name                  = var.appinsightname 
  location              = var.appinsightlocation    
  resource_group_name   = "rg-ads-dev-001"  
  tags                  = var.tag
  application_type      = "web"

}
 