terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.5.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "3231ca8c-f392-4473-b23d-ef052e9eed0f"
  features {
  }
}

resource "azurerm_resource_group" "rg-aula-infra" {
  location = "eastus"
  name     = "rg-aula-infra"
}

resource "azurerm_kubernetes_cluster" "aks-aula-infra" {
  name                = "aks-aula-infra"
  location            = azurerm_resource_group.rg-aula-infra.location
  resource_group_name = azurerm_resource_group.rg-aula-infra.name
  dns_prefix          = "aks-aula-infra"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  web_app_routing {
    dns_zone_ids = [] # Optional: Add Azure DNS Zone IDs for custom domains
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}

