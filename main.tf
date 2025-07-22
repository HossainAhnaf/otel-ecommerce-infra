
module "naming" {
  source = "git::https://github.com/Azure/terraform-azurerm-naming.git?ref=75d5afa" # v0.4.2
  suffix = local.naming_suffix
}

resource "random_id" "prefix" {
  byte_length = 4
}

resource "azurerm_resource_group" "main" {
  name     = module.naming.resource_group.name
  location = var.location
}



module "aks" {
  source               = "git::https://github.com/Azure/terraform-azurerm-aks.git?ref=9b3948525970cb893aefc992ee7dba5604b9cdc2"
  location             = azurerm_resource_group.main.location
  resource_group_name  = azurerm_resource_group.main.name
  cluster_name         = module.naming.kubernetes_cluster.name
  prefix               = random_id.prefix.hex
  agents_count         = var.aks_agent_count
  agents_size          = var.aks_agent_size
  agents_max_pods      = var.aks_agent_max_pods
  agents_min_count     = var.aks_agent_min_count
  agents_max_count     = var.aks_agent_max_count
  azure_policy_enabled = var.aks_azure_policy_enabled
  sku_tier             = var.aks_sku_tier
  enable_auto_scaling  = var.aks_enable_auto_scaling
  depends_on           = [azurerm_resource_group.main]
}
