terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">= 3.5.0"
    }
  }
}

provider "azurerm" {
    features {
    }
}

resource "azurerm_resource_group" "rg-aula-infra" {
    location = "eastus"
    name = "rg-aula-infra"
}

resource "azurerm_kubernetes_cluster" "aks-aula-infra" {
  name                = "aks-aula-infra"
  location            = azurerm_resource_group.rg-aula-infra.location
  resource_group_name = azurerm_resource_group.rg-aula-infra.name
  dns_prefix          = "aks-aula-infra"
  http_application_routing_enabled = true

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}