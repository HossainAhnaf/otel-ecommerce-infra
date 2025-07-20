# resource "azurerm_key_vault" "main" {
#   name                        = "${var.prefix}-kv"
#   location                    = var.location
#   resource_group_name         = var.resource_group_name
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   sku_name                    = "standard"
#   purge_protection_enabled    = true
# }

# resource "azurerm_key_vault_key" "main" {
#   name         = "disk-encryption-key"
#   key_vault_id = azurerm_key_vault.main.id
#   key_type     = "RSA"
#   key_size     = 2048
# }


# # checkov:skip=CKV_AZURE_4 "Skipping AKS logging check due to environment constraints"
# resource "azurerm_user_assigned_identity" "aks" {
#   name                = "${var.prefix}-aks-identity"
#   resource_group_name = var.resource_group_name
#   location            = var.location
# }


# resource "azurerm_disk_encryption_set" "aks" {
#   name                = "${var.cluster_name}-disk-encryption-set"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   identity {
#     type         = "UserAssigned"
#     identity_ids = [azurerm_user_assigned_identity.aks.id]
#   }
#   key_vault_key_id =  azurerm_key_vault_key.main.id

# }


# resource "azurerm_kubernetes_cluster" "main" {
#   resource_group_name       = var.resource_group_name
#   location                  = var.location
#   name                      = var.cluster_name
#   dns_prefix                = var.dns_prefix
#   sku_tier                  = var.sku_tier
#   automatic_upgrade_channel = var.automatic_upgrade_channel
#   disk_encryption_set_id    = azurerm_disk_encryption_set.aks.id

#   local_account_disabled  = true
#   azure_policy_enabled    = true
#   private_cluster_enabled = true

#   default_node_pool {
#     name                         = var.node_pool.name
#     node_count                   = var.node_pool.node_count
#     vm_size                      = var.node_pool.vm_size
#     os_disk_type                 = var.node_pool.os_disk_type
#     max_pods                     = var.node_pool.max_pods
#     only_critical_addons_enabled = true
#     host_encryption_enabled      = true
#   }

#   identity {
#     type         = "UserAssigned"
#     identity_ids = [azurerm_user_assigned_identity.aks.id]
#   }
#   api_server_access_profile {
#     authorized_ip_ranges = var.authorized_ip_ranges
#   }
#   network_profile {
#     network_plugin = "azure"
#     network_policy = "azure"
#   }
#   key_vault_secrets_provider {
#     secret_rotation_enabled = true
#   }
# }

module "aks" {
  source               = "git::https://github.com/Azure/terraform-azurerm-aks.git?ref=9b3948525970cb893aefc992ee7dba5604b9cdc2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  prefix               = var.prefix
  cluster_name         = var.cluster_name
  agents_count         = var.node_pool.node_count
  agents_size          = var.node_pool.vm_size
  agents_max_pods      = var.node_pool.max_pods
  agents_pool_name     = var.node_pool.name
  azure_policy_enabled = true
  sku_tier             = var.sku_tier
}
