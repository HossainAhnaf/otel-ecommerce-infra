terraform {

  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "tfstatehasan"
    container_name       = "otel-ovi"
    key                  = "otel-eccommerce.tfstate"
  }
}
