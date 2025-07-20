resource "azurerm_resource_group" "main" {
  name     = local.resource_group
  location = local.location
}


module "aks_cluster" {
  source              = "./modules/aks_cluster"
  prefix              = var.prefix
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  cluster_name        = local.aks_cluster_name
  sku_tier            = var.sku_tier
  node_pool = {
    name       = var.node_pool.name
    node_count = var.node_pool.node_count
    vm_size    = var.node_pool.vm_size
    max_pods   = var.node_pool.max_pods
  }
}
