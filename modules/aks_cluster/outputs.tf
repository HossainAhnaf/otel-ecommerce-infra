output "cluster_credentials_download_command" {
  value = "az aks get-credentials --resource-group ${var.resource_group_name} --name ${var.cluster_name} --overwrite-existing"

}
