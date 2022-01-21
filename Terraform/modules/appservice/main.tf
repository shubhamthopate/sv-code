data "azurerm_app_service_plan" "example" {
name = "apsvcpl-ads-dev-001"
resource_group_name ="rg-ads-dev-001"
  
}

resource "azurerm_app_service" "example" {
  count = 2
  name                ="${var.appservice_name}-${count.index}"
  location            = "eastus"
  resource_group_name = "rg-ads-dev-001" 
  app_service_plan_id = data.azurerm_app_service_plan.example.id
  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    java_version             = "11"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }


}