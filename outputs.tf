output "cluster_credentials_download_command" {
  value = "az aks get-credentials --resource-group ${azurerm_resource_group.main.name} --name ${module.aks.aks_name} --overwrite-existing"

}
