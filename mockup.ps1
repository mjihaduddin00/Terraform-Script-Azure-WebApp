terraform {    
    required_providers {    
      azurerm = {    
        source = "hashicorp/azurerm"    
      }    
    }    
  }    
  provider "azurerm" {    
    features {}    
  }    
  resource "azurerm_resource_group" "{ResourceGroup}" {    
    name = "{ResourceGroup}"    
    location = "eastus"    
  }   
  resource "azurerm_app_service_plan" "{AppServicePlanName}" {  
    name                = "{AppServicePlanName}"  
    location            = "eastus"  
    resource_group_name = azurerm_resource_group.{ResourceGroup}.name  
    
    sku {  
      tier = "Standard"  
      size = "S1"  
    }  
  }  
    
  resource "azurerm_app_service" "{WebAppName}" {  
    name                = "{WebAppName}"  
    location            = "eastus"  
    resource_group_name = azurerm_resource_group.{ResourceGroup}.name  
    app_service_plan_id = azurerm_app_service_plan.{AppServicePlanName}.id  
    
    app_settings = {  
      "DeviceName" = "SampleDevice",  
      "DeviceId" = "2"  
    }  
  }  